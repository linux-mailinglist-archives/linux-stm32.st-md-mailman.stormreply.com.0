Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D4BA9B058
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 16:14:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFD05C78F68;
	Thu, 24 Apr 2025 14:14:34 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A15C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 14:14:33 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-310447fe59aso13668261fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745504072; x=1746108872;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
 b=aA76nb/OsJ75eD/DGMqir2sPslNfBeQBdx0jbUsq9x8Y6UoSYCbZDcwSM2uSxd4TGG
 NxXX+FVUuiET20iiI+ANzFa12lOs0mR5i4YuNGBLFHij4MNVcZWMoA3MRdomnuvP8Vu4
 yxkCocSYlD3AfMwYakiEoHBZQKKRtFt4D5cuakusuRo6J6ktcfsy3UCbvuT54l5+P63z
 Pf18dZKu/JFxOtVYVeuhOFCdShh699aFDHWRVPq51zfX7GF7NkHzRjdVBsh6n4ZoANDm
 W5CYXoTuRie5Kz8x/1SKjxbejnGnkhfOG3DHWP6uNEzdu0qNt3UPRDXXGFVc33FaMa2t
 I4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745504072; x=1746108872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
 b=f1cVAc9tVUjHy3H+CRYgC3aZod2FvAYYhx1KF2zQ48ceoInSDJ1t7iRBDVrdU+bf0N
 x/aKfxPsvaxTqenmRKXgEDUnI9aHH2TYS1Ie5HmUcEbTY383lPZxfGgpW//TKpJQyUc1
 kYN1b+b2VmVDLyVH7nUa08751ubv3hrMsX2iX9ZkTGuRli0xgLo+93gvWB5ToXhn9UHy
 bowZbhbjXKRowrP8rOu7WQPRdKeYvtEZ2+aGLmc9TjGVhjexSjmZ/ozCD3oNnYv2IqCx
 UCGHRB8/91Px68RENAACudbbydTLmOppygrHodQcgIfwMuGvlbavFusbN3Y/Kt/iPeZB
 9C3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+ZiSJ7Ku/39znTznRblbyRfzjt9EMSuxLC+az1IZyR9pUK/1dhcqwSMtpmeW6FghuCCWdexW2sT2Dpg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPdu9WJCqz6/kLXoxaX27BBqRdwCMA034EJNqj7n2jtJd0t83d
 1O5ivigs5N2eWKKJPki1QEaG45qMF4sV7NzRa5lVrh6V0gm4Cs60VyrsHV+j/3iilQcK4bP/oPp
 zSfxDDIIn4l0b7wWb3r+Im1duWdzEhfeW6HuxQQ==
X-Gm-Gg: ASbGnctNsM548uaH2MAHwJnTakVlJoIRLHIrYP3g0ulrq8LPljztv+R0aGKDOJ9Txcv
 47SEw7S0KvBe6qTEV3p2HWS2RC3zvkvbkcdsslBY8n9HCi+LCFOzrVlahIyTLLgU6uAbeuh4yAl
 /wWN7ugeeEqiCiGdoSqYQKG7RprRyXOSA3KCrW/5AXqWOi0CAwCKNw1vLe
X-Google-Smtp-Source: AGHT+IGTSgfmE4C9KUY01cBQCa6U+zujjBr3JQn5JFHu87otSRTtbM+9TibC6Ub/YfaplbG5HQdBpJHJtYPG69/HM40=
X-Received: by 2002:a05:651c:885:b0:30d:e104:cd56 with SMTP id
 38308e7fff4ca-3179ffc1202mr10727731fa.39.1745504072212; Thu, 24 Apr 2025
 07:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Apr 2025 08:14:20 -0600
X-Gm-Features: ATxdqUEG7UgU0b-fYJDsj-X6YeibPATP71Sc8xsrfndaXkHmANCAN6IFo1WtuOI
Message-ID: <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>,
 "Andrew F. Davis" <afd@ti.com>, "Shah, Tanmay" <tanmay.shah@amd.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravana Kannan <saravanak@google.com>, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Chen-Yu Tsai <wens@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] of: Common "memory-region" parsing
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

Arnaud, Daniel, Iuliana, Andrew and Tanmay - please test this patchset
on the platforms you are working on.

Thanks,
Mathieu

On Wed, 23 Apr 2025 at 13:42, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> While there's a common function to parse "memory-region" properties for
> DMA pool regions, there's not anything for driver private regions. As a
> result, drivers have resorted to parsing "memory-region" properties
> themselves repeating the same pattern over and over. To fix this, this
> series adds 2 functions to handle those cases:
> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>
> I've converted the whole tree, but just including remoteproc here as
> it has the most cases. I intend to apply the first 3 patches for 6.16
> so the driver conversions can be applied for 6.17.
>
> A git tree with all the drivers converted is here[1].
>
> v2:
> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
> - Export devm_ioremap_resource_wc()
> - Rework handling of resource name to drop unit-address from name as it
>   was before.
> - Link to v1:
>   https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (4):
>       of: reserved_mem: Add functions to parse "memory-region"
>       of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>       devres: Export devm_ioremap_resource_wc()
>       remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
>
>  drivers/of/device.c                       | 31 +++++-------
>  drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>  drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>  drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>  drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>  include/linux/of_reserved_mem.h           | 26 ++++++++++
>  lib/devres.c                              |  1 +
>  18 files changed, 339 insertions(+), 369 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
>
> Best regards,
> --
> Rob Herring (Arm) <robh@kernel.org>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
