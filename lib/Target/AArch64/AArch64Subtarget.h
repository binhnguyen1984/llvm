//===--- AArch64Subtarget.h - Define Subtarget for the AArch64 -*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the AArch64 specific subclass of TargetSubtarget.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_AARCH64_AARCH64SUBTARGET_H
#define LLVM_LIB_TARGET_AARCH64_AARCH64SUBTARGET_H

#include "AArch64FrameLowering.h"
#include "AArch64ISelLowering.h"
#include "AArch64InstrInfo.h"
#include "AArch64RegisterInfo.h"
#include "AArch64SelectionDAGInfo.h"
#include "llvm/CodeGen/GlobalISel/CallLowering.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelector.h"
#include "llvm/CodeGen/GlobalISel/LegalizerInfo.h"
#include "llvm/CodeGen/GlobalISel/RegisterBankInfo.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"
#include "llvm/IR/DataLayout.h"
#include <string>

#define GET_SUBTARGETINFO_HEADER
#include "AArch64GenSubtargetInfo.inc"

namespace llvm {
class GlobalValue;
class StringRef;
class Triple;

class AArch64Subtarget final : public AArch64GenSubtargetInfo {
public:
  enum ARMProcFamilyEnum : uint8_t {
    Others,
    CortexA35,
    CortexA53,
    CortexA55,
    CortexA57,
    CortexA72,
    CortexA73,
    CortexA75,
    Cyclone,
    ExynosM1,
    ExynosM3,
    Falkor,
    Kryo,
    Saphira,
    ThunderX2T99,
    ThunderX,
    ThunderXT81,
    ThunderXT83,
    ThunderXT88
  };

protected:
  /// ARMProcFamily - ARM processor family: Cortex-A53, Cortex-A57, and others.
  ARMProcFamilyEnum ARMProcFamily = Others;

  bool HasV8_1aOps = false;
  bool HasV8_2aOps = false;
  bool HasV8_3aOps = false;

  bool HasFPARMv8 = false;
  bool HasNEON = false;
  bool HasCrypto = false;
  bool HasDotProd = false;
  bool HasCRC = false;
  bool HasLSE = false;
  bool HasRAS = false;
  bool HasRDM = false;
  bool HasPerfMon = false;
  bool HasFullFP16 = false;
  bool HasSPE = false;
  bool HasLSLFast = false;
  bool HasSVE = false;
  bool HasRCPC = false;
  bool HasAggressiveFMA = false;

  // HasZeroCycleRegMove - Has zero-cycle register mov instructions.
  bool HasZeroCycleRegMove = false;

  // HasZeroCycleZeroing - Has zero-cycle zeroing instructions.
  bool HasZeroCycleZeroing = false;
  bool HasZeroCycleZeroingFPWorkaround = false;

  // StrictAlign - Disallow unaligned memory accesses.
  bool StrictAlign = false;

  // NegativeImmediates - transform instructions with negative immediates
  bool NegativeImmediates = true;

  // Enable 64-bit vectorization in SLP.
  unsigned MinVectorRegisterBitWidth = 64;

  bool UseAA = false;
  bool PredictableSelectIsExpensive = false;
  bool BalanceFPOps = false;
  bool CustomAsCheapAsMove = false;
  bool ExynosAsCheapAsMove = false;
  bool UsePostRAScheduler = false;
  bool Misaligned128StoreIsSlow = false;
  bool Paired128IsSlow = false;
  bool STRQroIsSlow = false;
  bool UseAlternateSExtLoadCVTF32Pattern = false;
  bool HasArithmeticBccFusion = false;
  bool HasArithmeticCbzFusion = false;
  bool HasFuseAddress = false;
  bool HasFuseAES = false;
  bool HasFuseCCSelect = false;
  bool HasFuseLiterals = false;
  bool DisableLatencySchedHeuristic = false;
  bool UseRSqrt = false;
  uint8_t MaxInterleaveFactor = 2;
  uint8_t VectorInsertExtractBaseCost = 3;
  uint16_t CacheLineSize = 0;
  uint16_t PrefetchDistance = 0;
  uint16_t MinPrefetchStride = 1;
  unsigned MaxPrefetchIterationsAhead = UINT_MAX;
  unsigned PrefFunctionAlignment = 0;
  unsigned PrefLoopAlignment = 0;
  unsigned MaxJumpTableSize = 0;
  unsigned WideningBaseCost = 0;

  // ReserveX18 - X18 is not available as a general purpose register.
  bool ReserveX18;

  bool IsLittle;

  /// TargetTriple - What processor and OS we're targeting.
  Triple TargetTriple;

  AArch64FrameLowering FrameLowering;
  AArch64InstrInfo InstrInfo;
  AArch64SelectionDAGInfo TSInfo;
  AArch64TargetLowering TLInfo;

  /// GlobalISel related APIs.
  std::unique_ptr<CallLowering> CallLoweringInfo;
  std::unique_ptr<InstructionSelector> InstSelector;
  std::unique_ptr<LegalizerInfo> Legalizer;
  std::unique_ptr<RegisterBankInfo> RegBankInfo;

private:
  /// initializeSubtargetDependencies - Initializes using CPUString and the
  /// passed in feature string so that we can use initializer lists for
  /// subtarget initialization.
  AArch64Subtarget &initializeSubtargetDependencies(StringRef FS,
                                                    StringRef CPUString);

  /// Initialize properties based on the selected processor family.
  void initializeProperties();

public:
  /// This constructor initializes the data members to match that
  /// of the specified triple.
  AArch64Subtarget(const Triple &TT, const std::string &CPU,
                   const std::string &FS, const TargetMachine &TM,
                   bool LittleEndian);

  const AArch64SelectionDAGInfo *getSelectionDAGInfo() const override {
    return &TSInfo;
  }
  const AArch64FrameLowering *getFrameLowering() const override {
    return &FrameLowering;
  }
  const AArch64TargetLowering *getTargetLowering() const override {
    return &TLInfo;
  }
  const AArch64InstrInfo *getInstrInfo() const override { return &InstrInfo; }
  const AArch64RegisterInfo *getRegisterInfo() const override {
    return &getInstrInfo()->getRegisterInfo();
  }
  const CallLowering *getCallLowering() const override;
  const InstructionSelector *getInstructionSelector() const override;
  const LegalizerInfo *getLegalizerInfo() const override;
  const RegisterBankInfo *getRegBankInfo() const override;
  const Triple &getTargetTriple() const { return TargetTriple; }
  bool enableMachineScheduler() const override { return true; }
  bool enablePostRAScheduler() const override {
    return UsePostRAScheduler;
  }

  /// Returns ARM processor family.
  /// Avoid this function! CPU specifics should be kept local to this class
  /// and preferably modeled with SubtargetFeatures or properties in
  /// initializeProperties().
  ARMProcFamilyEnum getProcFamily() const {
    return ARMProcFamily;
  }

  bool hasV8_1aOps() const { return HasV8_1aOps; }
  bool hasV8_2aOps() const { return HasV8_2aOps; }
  bool hasV8_3aOps() const { return HasV8_3aOps; }

  bool hasZeroCycleRegMove() const { return HasZeroCycleRegMove; }

  bool hasZeroCycleZeroing() const { return HasZeroCycleZeroing; }

  bool hasZeroCycleZeroingFPWorkaround() const {
    return HasZeroCycleZeroingFPWorkaround;
  }

  bool requiresStrictAlign() const { return StrictAlign; }

  bool isXRaySupported() const override { return true; }

  unsigned getMinVectorRegisterBitWidth() const {
    return MinVectorRegisterBitWidth;
  }

  bool isX18Reserved() const { return ReserveX18; }
  bool hasFPARMv8() const { return HasFPARMv8; }
  bool hasNEON() const { return HasNEON; }
  bool hasCrypto() const { return HasCrypto; }
  bool hasDotProd() const { return HasDotProd; }
  bool hasCRC() const { return HasCRC; }
  bool hasLSE() const { return HasLSE; }
  bool hasRAS() const { return HasRAS; }
  bool hasRDM() const { return HasRDM; }
  bool balanceFPOps() const { return BalanceFPOps; }
  bool predictableSelectIsExpensive() const {
    return PredictableSelectIsExpensive;
  }
  bool hasCustomCheapAsMoveHandling() const { return CustomAsCheapAsMove; }
  bool hasExynosCheapAsMoveHandling() const { return ExynosAsCheapAsMove; }
  bool isMisaligned128StoreSlow() const { return Misaligned128StoreIsSlow; }
  bool isPaired128Slow() const { return Paired128IsSlow; }
  bool isSTRQroSlow() const { return STRQroIsSlow; }
  bool useAlternateSExtLoadCVTF32Pattern() const {
    return UseAlternateSExtLoadCVTF32Pattern;
  }
  bool hasArithmeticBccFusion() const { return HasArithmeticBccFusion; }
  bool hasArithmeticCbzFusion() const { return HasArithmeticCbzFusion; }
  bool hasFuseAddress() const { return HasFuseAddress; }
  bool hasFuseAES() const { return HasFuseAES; }
  bool hasFuseCCSelect() const { return HasFuseCCSelect; }
  bool hasFuseLiterals() const { return HasFuseLiterals; }

  /// Return true if the CPU supports any kind of instruction fusion.
  bool hasFusion() const {
    return hasArithmeticBccFusion() || hasArithmeticCbzFusion() ||
           hasFuseAES() || hasFuseCCSelect() || hasFuseLiterals();
  }

  bool useRSqrt() const { return UseRSqrt; }
  unsigned getMaxInterleaveFactor() const { return MaxInterleaveFactor; }
  unsigned getVectorInsertExtractBaseCost() const {
    return VectorInsertExtractBaseCost;
  }
  unsigned getCacheLineSize() const { return CacheLineSize; }
  unsigned getPrefetchDistance() const { return PrefetchDistance; }
  unsigned getMinPrefetchStride() const { return MinPrefetchStride; }
  unsigned getMaxPrefetchIterationsAhead() const {
    return MaxPrefetchIterationsAhead;
  }
  unsigned getPrefFunctionAlignment() const { return PrefFunctionAlignment; }
  unsigned getPrefLoopAlignment() const { return PrefLoopAlignment; }

  unsigned getMaximumJumpTableSize() const { return MaxJumpTableSize; }

  unsigned getWideningBaseCost() const { return WideningBaseCost; }

  /// CPU has TBI (top byte of addresses is ignored during HW address
  /// translation) and OS enables it.
  bool supportsAddressTopByteIgnored() const;

  bool hasPerfMon() const { return HasPerfMon; }
  bool hasFullFP16() const { return HasFullFP16; }
  bool hasSPE() const { return HasSPE; }
  bool hasLSLFast() const { return HasLSLFast; }
  bool hasSVE() const { return HasSVE; }
  bool hasRCPC() const { return HasRCPC; }
  bool hasAggressiveFMA() const { return HasAggressiveFMA; }

  bool isLittleEndian() const { return IsLittle; }

  bool isTargetDarwin() const { return TargetTriple.isOSDarwin(); }
  bool isTargetIOS() const { return TargetTriple.isiOS(); }
  bool isTargetLinux() const { return TargetTriple.isOSLinux(); }
  bool isTargetWindows() const { return TargetTriple.isOSWindows(); }
  bool isTargetAndroid() const { return TargetTriple.isAndroid(); }
  bool isTargetFuchsia() const { return TargetTriple.isOSFuchsia(); }

  bool isTargetCOFF() const { return TargetTriple.isOSBinFormatCOFF(); }
  bool isTargetELF() const { return TargetTriple.isOSBinFormatELF(); }
  bool isTargetMachO() const { return TargetTriple.isOSBinFormatMachO(); }

  bool useAA() const override { return UseAA; }

  bool useSmallAddressing() const {
    switch (TLInfo.getTargetMachine().getCodeModel()) {
      case CodeModel::Kernel:
        // Kernel is currently allowed only for Fuchsia targets,
        // where it is the same as Small for almost all purposes.
      case CodeModel::Small:
        return true;
      default:
        return false;
    }
  }

  /// ParseSubtargetFeatures - Parses features string setting specified
  /// subtarget options.  Definition of function is auto generated by tblgen.
  void ParseSubtargetFeatures(StringRef CPU, StringRef FS);

  /// ClassifyGlobalReference - Find the target operand flags that describe
  /// how a global value should be referenced for the current subtarget.
  unsigned char ClassifyGlobalReference(const GlobalValue *GV,
                                        const TargetMachine &TM) const;

  unsigned char classifyGlobalFunctionReference(const GlobalValue *GV,
                                                const TargetMachine &TM) const;

  void overrideSchedPolicy(MachineSchedPolicy &Policy,
                           unsigned NumRegionInstrs) const override;

  bool enableEarlyIfConversion() const override;

  std::unique_ptr<PBQPRAConstraint> getCustomPBQPConstraints() const override;

  bool isCallingConvWin64(CallingConv::ID CC) const {
    switch (CC) {
    case CallingConv::C:
      return isTargetWindows();
    case CallingConv::Win64:
      return true;
    default:
      return false;
    }
  }

  void mirFileLoaded(MachineFunction &MF) const override;
};
} // End llvm namespace

#endif
