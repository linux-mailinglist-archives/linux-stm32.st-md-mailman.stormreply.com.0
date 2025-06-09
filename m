Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E631AD224D
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jun 2025 17:23:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23023C32E8F;
	Mon,  9 Jun 2025 15:23:15 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A768C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 15:23:13 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-73bf5aa95e7so3284825b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jun 2025 08:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749482592; x=1750087392;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4+Mg6PW+/K0QnsP+hIHi7hEEWjzJrekcG6Ta5Fzf3T0=;
 b=lbaytEs9DRzMGVNvndvvNDf14jX1bfgP8km49aKiVbxCzLxzIrxjI8zZbXnPDm7kvi
 WLJvwzOXTOW4wVKSo+LE2D1KRVOOzvA9fBzaId1XB9OYxlxgwlS8Mrj1yR50cNl/0iUF
 GSbjfwiUk/szbLrL31Jpx+JsEiG6Lh6JIc1mpwVHDwItPEDhnJzAwmLZhMGxI4EwgFw5
 z2FKpzf3PUICpRFJuIm1vb0IuXBqmoDuzMhwr9ikYyAgCTBzdjqkNlJgW26oakOcSasV
 OMFWQr52YlepJ46mMZk1c9+qENNOTpr1D4HGw6TAUaAaKs4Utf29jUhqioD/HAYIaTK8
 w6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749482592; x=1750087392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+Mg6PW+/K0QnsP+hIHi7hEEWjzJrekcG6Ta5Fzf3T0=;
 b=jzPg/MoExUacDZj7x2gIJT46N/MnUGe3KXuwahsN5sAPxV3aNeQg81e4z1aZWgryIw
 vZKX5NWqsObKOiP8BbpQjjFrrS5eKovgg/EVwxAjF++SSOgtqR3APCTsnZ/7xR1+jg6K
 2RIznAXtwF4IUldjMnhh6vUWCJNdxdY/FlcIrFrdl3ZpQ+UjEuoOWT+jUQSPT0Op4f9s
 hjP1oPjvkr3Sjv25d3D//N2jJ4hxm2pxRWomCfU13sAKRhWeP/l4JyoC42ppnFCiqxhv
 bwgEDPccZozZ2jMpo9yibt/y+DbQWi1bSGg0yIJxc7tjKBr2sW+Txqu4dmzM/1AH3j6R
 KQ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn6PNBIv0LsDGhRDCp3TmNHSbeslYd5Ui9kkVFy43tEogReIepxZUklID7QDObNOhqzKz7zTmA35J+qg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfN7h27d1xY59l0jnIiRBXcc+UtlEIz8p0N7L9W3jymHcuz5Gm
 ZPMTgxJkvoKYLSlAmI8oFlIU4LTNreTFmH2wPcKLjLji/Lv5423jQ0H7BAbhT2mExOA=
X-Gm-Gg: ASbGncuvbj+baunR70Q1IWcETQLucSv+SiSnODFtV+KsQ/rx3oDtZQNg/8agXDvmCaN
 Vkbun/AO0HQH9EhWJI4cQbnf4gfbD3AddCQDua/awIG3ZAyLjJCO3k65mMKtptowux7Q4QcPAMF
 Xs36VRz+Pe/QsJn0LNaG5e8Ztg2QBfBZkdG/Fq2F2PK9dpohSbLDOUflSTkkQqLXHp3N8Uf7TWm
 Ns/L6B9mSp2Syc4c4W45wYMcjO0l4AsPcKC42d00hSmLnCb0zDsmk/wpGrz7MXGN80ppMv1W3+y
 Bt+Fp8PwtsqHPDYBwK4AsPQtueLQH7WX85Phssq+mmhv/+ETBMitoX2dNxv5F1xiCbLCPHQFwt1
 z
X-Google-Smtp-Source: AGHT+IEHQs24xS7vzskFJPPr8eh6p9W8ZrujNawhU2iz0AreagkiHluW65S1z22AdhoPCthNzNJd4g==
X-Received: by 2002:a17:90b:3891:b0:312:26d9:d5b4 with SMTP id
 98e67ed59e1d1-3134740b55cmr21132387a91.17.1749482592330; 
 Mon, 09 Jun 2025 08:23:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1329:68ff:ffeb:cd9c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fc374asm5791390a91.29.2025.06.09.08.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:23:11 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:23:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <aEb8XbhY5dR__GM-@p14s>
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v16 0/6] Introduction of a
 remoteproc tee to load signed firmware
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

On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
> Hello Bjorn and Mathieu,
> 
> I am resending this series after waiting for over two months for Bjorn's
> feedback, despite a prior reminder.
> 
> Please could you coordinate between yourselves to determine who will continue
> reviewing this series? It would be greatly appreciated if the review could
> proceed within a more reasonable timeframe.
> 
> Thanks in advance and best regards,
> Arnaud
> 
> 
> Main updates from version V15[1]:
> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
>   load and authenticate the firmware before getting the resource table.
> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
>   bind/unbind.
>

Have all pending issues been resolved or is there still questions about some
aspects of the design?
 
> More details are available in each patch commit message.
> 
> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
> 
> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
> 
> Description of the feature:
> --------------------------
> This series proposes the implementation of a remoteproc tee driver to
> communicate with a TEE trusted application responsible for authenticating
> and loading the remoteproc firmware image in an Arm secure context.
> 
> 1) Principle:
> 
> The remoteproc tee driver provides services to communicate with the OP-TEE
> trusted application running on the Trusted Execution Context (TEE).
> The trusted application in TEE manages the remote processor lifecycle:
> 
> - authenticating and loading firmware images,
> - isolating and securing the remote processor memories,
> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> - managing the start and stop of the firmware by the TEE.
> 
> 2) Format of the signed image:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> 
> 3) OP-TEE trusted application API:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> 
> 4) OP-TEE signature script
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> 
> Example of usage:
> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> 
> 
> 5) Impact on User space Application
> 
> No sysfs impact. The user only needs to provide the signed firmware image
> instead of the ELF image.
> 
> 
> For more information about the implementation, a presentation is available here
> (note that the format of the signed image has evolved between the presentation
> and the integration in OP-TEE).
> 
> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> 
> Arnaud Pouliquen (6):
>   remoteproc: core: Introduce rproc_pa_to_va helper
>   remoteproc: Add TEE support
>   remoteproc: Introduce release_fw optional operation
>   dt-bindings: remoteproc: Add compatibility for TEE support
>   remoteproc: stm32: Create sub-functions to request shutdown and
>     release
>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> 
>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
>  drivers/remoteproc/Kconfig                    |  10 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/remoteproc_core.c          |  52 ++
>  drivers/remoteproc/remoteproc_internal.h      |   6 +
>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
>  include/linux/remoteproc.h                    |   4 +
>  include/linux/remoteproc_tee.h                |  90 +++
>  9 files changed, 935 insertions(+), 44 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>  create mode 100644 include/linux/remoteproc_tee.h
> 
> 
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
