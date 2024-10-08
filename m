Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13E99516C
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 16:23:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E424EC7128F;
	Tue,  8 Oct 2024 14:23:22 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A5CBC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 14:23:16 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7d916b6a73aso3482282a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Oct 2024 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728397394; x=1729002194;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3s0y0U4U/zNTntZ4JNtG+dOk0GuXy1+AAJizNLWCVpk=;
 b=F6vSb6tgx3SRJB+LbGlv2fl8U8azD0ZxoEUTHF9G3Ar2o+hqh5RTlcKJz5/L1uUwco
 HZfqJ5iF/g88iJ/fbJuViqnoXZIvYIDORC6jvYH8TyCgFIF96lidcSph4FGSull5Fpl3
 GYbdrYkGEV9bGgtn0aMNu4Rf+Ei7spH5ZlgRwF+co7jXzmnKMbmRE/eyFfwcXuQBf4ua
 go/+cRI+AFxvdwIlRSOKC8eY+agTk7IPTX6KtDhlNNoxsnYnBRAUUu2wO789mIuIT1dm
 +8Qs1TiLWTsiNz6ZVqbhlKh47BvlXXX5lBP56W7TU9sFEw7I3iflCeez9qNnyxCO1oFN
 6bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728397394; x=1729002194;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3s0y0U4U/zNTntZ4JNtG+dOk0GuXy1+AAJizNLWCVpk=;
 b=Y4dCweJ67LxLHSUMET9gefXSHqto5WjBTBoWnqhmt84w3EeIfJIqAv1C/DPgLWrQod
 HKkXpmwTS7mROr20Q8h3H8Ax1yXskVsFjibRVUfeESmni6TDUYPHwiNKtM3FKQiuTlAo
 b9a/JrH2w7QTrj+SbdTVEFMq2Fvug8XbR/NrIjA830IG2eUAzHpYkxOAw+NidqR04xyv
 bjnVvRSpq3ccdi9f3g28KJ+HYSgd80ajE8CVdKCGH/T0Ja31yp6lxoeogFC7YcF0/tLe
 tDJKst4Lyuqu/XXqHZEdfRb2dEb1pty3UDYrNd6vUgjUPrI0wZRdn4S37acHE5qwKtNf
 DKjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM3rR+SFJSYULF88BrNBQVmWVmdYNltxPX9iyYbBmBg270WiQTG19RjFVIDOD5ZstPwFeXLtstFKtlfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyrr1ebAEw2ikkWXAagMzlq7pJixyzOcZ/k2QVn0HFCtHv7QVEZ
 5E7OvF+eOK4ItwZaQ3lFZp6RLt/T92wZqiLn+8w7VSdDPhZLIAYwP2qvse+Y480=
X-Google-Smtp-Source: AGHT+IET4qjoJB1wWodF/QyFu2wMpdITwsro6eNAfvM/IE1PiYckOL2Jg39NTknxUkJQohIJiVZU3w==
X-Received: by 2002:a05:6a20:d50b:b0:1d7:1040:8519 with SMTP id
 adf61e73a8af0-1d710408630mr2986112637.42.1728397394539; 
 Tue, 08 Oct 2024 07:23:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e3a0:1c0:95c8:8b16])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0cd2a1bsm6168882b3a.85.2024.10.08.07.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 07:23:14 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:23:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: kernel test robot <lkp@intel.com>
Message-ID: <ZwVATlRbo0OdRLbj@p14s>
References: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
 <202410081902.TwQcmWjk-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202410081902.TwQcmWjk-lkp@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 op-tee@lists.trustedfirmware.org, Paul Gazzillo <paul@pgazz.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 oe-kbuild-all@lists.linux.dev, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10 7/7] remoteproc: stm32: Add support of
 an OP-TEE TA to load the firmware
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

From hereon and starting with this version, I will not review patchets that
don't pass the compilation bots.

Mathieu

On Tue, Oct 08, 2024 at 07:07:40PM +0800, kernel test robot wrote:
> Hi Arnaud,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Arnaud-Pouliquen/remoteproc-core-Introduce-rproc_pa_to_va-helper/20241007-212358
> base:   9852d85ec9d492ebef56dc5f229416c925758edc
> patch link:    https://lore.kernel.org/r/20241007131620.2090104-8-arnaud.pouliquen%40foss.st.com
> patch subject: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> config: alpha-kismet-CONFIG_REMOTEPROC_TEE-CONFIG_STM32_RPROC-0-0 (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20241008/202410081902.TwQcmWjk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410081902.TwQcmWjk-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for REMOTEPROC_TEE when selected by STM32_RPROC
>    WARNING: unmet direct dependencies detected for REMOTEPROC_TEE
>      Depends on [n]: REMOTEPROC [=y] && OPTEE [=n]
>      Selected by [y]:
>      - STM32_RPROC [=y] && (ARCH_STM32 || COMPILE_TEST [=y]) && REMOTEPROC [=y]
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
