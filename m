Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA969C628
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Feb 2023 08:55:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4A6AC6A5E8;
	Mon, 20 Feb 2023 07:55:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08B22C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Feb 2023 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676879714; x=1708415714;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FZW5/j3uO31V1iPBqTannk1XJ56QpM62jjUtPnyt2z4=;
 b=lfGTsGW9XuUuFjN9pT0qKkvznRaZlKcs94kE2VrNPUgcI+1AfXqCD1U5
 g+N3pGJ2wCltF4Rfu27FaTB7g+cQxtuTEHgz3+h0bg94m/WOF7PTTcglV
 EDNNzFXXhcjJIHd1Tu4vugSRUCbnT7K9YoB5TaqoYQ+sTIoLEDZoGkQQ+
 /wCUcGk0w9Sabj9G3iaFIGVdC/W4oi7rCukgKCEBaaruAu1cw9vtlYnyD
 6rpIwA4wc/LCNppDElRUkcn7kVgfCR5NO+STbQ0yhoBKdlMUd37pktX4O
 yYVYjOE6N4zesjmOARidomulAUTYgQTUWI7ZEeQaY22UVU7mKqJurvv7B g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330059148"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="330059148"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 23:55:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="814045929"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="814045929"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 23:55:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pU10s-000Dlh-2n;
 Mon, 20 Feb 2023 07:55:06 +0000
Date: Mon, 20 Feb 2023 15:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org
Message-ID: <202302201535.Ns6H0Dok-lkp@intel.com>
References: <20230220051723.1257-5-masahisa.kojima@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220051723.1257-5-masahisa.kojima@linaro.org>
Cc: linux-efi@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] efi: Add tee-based EFI variable
	driver
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Masahisa,

I love your patch! Perhaps something to improve:

[auto build test WARNING on efi/next]
[cannot apply to linus/master v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230220-132235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20230220051723.1257-5-masahisa.kojima%40linaro.org
patch subject: [PATCH v2 4/4] efi: Add tee-based EFI variable driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230220/202302201535.Ns6H0Dok-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8ce55b3818062f45af62bc5eeb52f97585d0ffd1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230220-132235
        git checkout 8ce55b3818062f45af62bc5eeb52f97585d0ffd1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/efi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201535.Ns6H0Dok-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/stmm/tee_stmm_efi.c: In function 'tee_mm_communicate':
>> drivers/firmware/efi/stmm/tee_stmm_efi.c:60:13: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
      60 |         int rc;
         |             ^~


vim +/rc +60 drivers/firmware/efi/stmm/tee_stmm_efi.c

    44	
    45	/**
    46	 * tee_mm_communicate() - Pass a buffer to StandaloneMM running in TEE
    47	 *
    48	 * @comm_buf:		locally allocated communication buffer
    49	 * @dsize:		buffer size
    50	 * Return:		status code
    51	 */
    52	static efi_status_t tee_mm_communicate(void *comm_buf, size_t dsize)
    53	{
    54		size_t buf_size;
    55		efi_status_t ret;
    56		struct efi_mm_communicate_header *mm_hdr;
    57		struct tee_ioctl_invoke_arg arg;
    58		struct tee_param param[4];
    59		struct tee_shm *shm = NULL;
  > 60		int rc;
    61	
    62		if (!comm_buf)
    63			return EFI_INVALID_PARAMETER;
    64	
    65		mm_hdr = (struct efi_mm_communicate_header *)comm_buf;
    66		buf_size = mm_hdr->message_len + sizeof(efi_guid_t) + sizeof(size_t);
    67	
    68		if (dsize != buf_size)
    69			return EFI_INVALID_PARAMETER;
    70	
    71		shm = tee_shm_register_kernel_buf(pvt_data.ctx, comm_buf, buf_size);
    72		if (IS_ERR(shm)) {
    73			dev_err(pvt_data.dev, "Unable to register shared memory\n");
    74			return EFI_UNSUPPORTED;
    75		}
    76	
    77		memset(&arg, 0, sizeof(arg));
    78		arg.func = PTA_STMM_CMD_COMMUNICATE;
    79		arg.session = pvt_data.session;
    80		arg.num_params = 4;
    81	
    82		memset(param, 0, sizeof(param));
    83		param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
    84		param[0].u.memref.size = buf_size;
    85		param[0].u.memref.shm = shm;
    86		param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
    87		param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
    88		param[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
    89	
    90		rc = tee_client_invoke_func(pvt_data.ctx, &arg, param);
    91		tee_shm_free(shm);
    92	
    93		if (arg.ret != 0)
    94			return EFI_DEVICE_ERROR;
    95	
    96		switch (param[1].u.value.a) {
    97		case ARM_SVC_SPM_RET_SUCCESS:
    98			ret = EFI_SUCCESS;
    99			break;
   100	
   101		case ARM_SVC_SPM_RET_INVALID_PARAMS:
   102			ret = EFI_INVALID_PARAMETER;
   103			break;
   104	
   105		case ARM_SVC_SPM_RET_DENIED:
   106			ret = EFI_ACCESS_DENIED;
   107			break;
   108	
   109		case ARM_SVC_SPM_RET_NO_MEMORY:
   110			ret = EFI_OUT_OF_RESOURCES;
   111			break;
   112	
   113		default:
   114			ret = EFI_ACCESS_DENIED;
   115		}
   116	
   117		return ret;
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
