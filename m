Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9DF57E7F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ADBFC030B5
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:48 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95D63CDB400
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 08:30:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f10so3357907wmb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 01:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pIqrbsE6/Nv/138vVdlcEQnoXvw/3uCQiUSd/l1oIaY=;
 b=pxexbJDtUfEWhu0hxpc5BFseARVfL5lA1o7B7Tjq8/KJoQHN/BWRY287caYZxxAGbT
 ioUtA3MmG7EG/4mRQlaL6l8eNrh3xmAWOYGYDZJ/A+wTb+GjTwwRue2bBljfuAm7NdOm
 3ERvcq/8eZh6BrvyKxMwgUyRPLU30zX5uqWtC89337nkdb4nOq6Rd9sQaIUJ5hD+kqlF
 LPmi/F0OgnEQWOvX+ozFYp05cFrO4s6uXzTfU9j2U9jFJLqnW9SFEQznTK1Fd3jaDSyY
 zYw2TtQgYSsFiXKUUv1L21OAj1yYImGDWnhIXSgkL9UK/W94IbZweFu/x2Vv+xkqWp87
 1f8Q==
X-Gm-Message-State: APjAAAXe9vhU4DA9Ulcf5EF7Oy+5Nd616OJACQ9zlVzSkqiLl0KxeWuI
 7+IOq45bVGQeqNCny498V7jcfA==
X-Google-Smtp-Source: APXvYqxguQuxTuphnJ9ISpnJqaH4xcMLu4CCyeeLtDHqpdu4VJX+hsaHIz6Atqsiq1kkBiYITPXGpg==
X-Received: by 2002:a7b:c043:: with SMTP id u3mr910083wmc.56.1559205017089;
 Thu, 30 May 2019 01:30:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3da1:318a:275c:408?
 ([2001:b07:6468:f312:3da1:318a:275c:408])
 by smtp.gmail.com with ESMTPSA id y8sm1688765wmi.8.2019.05.30.01.30.15
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 01:30:16 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea534992-07ff-15d8-e48b-5fde37c88f73@redhat.com>
Date: Thu, 30 May 2019 10:30:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 David Airlie <airlied@linux.ie>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-pm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 09/22] docs: mark orphan documents as such
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

On 30/05/19 01:23, Mauro Carvalho Chehab wrote:
> Sphinx doesn't like orphan documents:
> 
>     Documentation/accelerators/ocxl.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32f429-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32f746-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32f769-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32h743-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/arm/stm32/stm32mp157-overview.rst: WARNING: document isn't included in any toctree
>     Documentation/gpu/msm-crash-dump.rst: WARNING: document isn't included in any toctree
>     Documentation/interconnect/interconnect.rst: WARNING: document isn't included in any toctree
>     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
>     Documentation/powerpc/isa-versions.rst: WARNING: document isn't included in any toctree
>     Documentation/virtual/kvm/amd-memory-encryption.rst: WARNING: document isn't included in any toctree
>     Documentation/virtual/kvm/vcpu-requests.rst: WARNING: document isn't included in any toctree
> 
> So, while they aren't on any toctree, add :orphan: to them, in order
> to silent this warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Please leave out KVM, I'll fix that instead.  Thanks for the report!

Paolo

> ---
>  Documentation/accelerators/ocxl.rst                 | 2 ++
>  Documentation/arm/stm32/overview.rst                | 2 ++
>  Documentation/arm/stm32/stm32f429-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32f746-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32f769-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32h743-overview.rst      | 2 ++
>  Documentation/arm/stm32/stm32mp157-overview.rst     | 2 ++
>  Documentation/gpu/msm-crash-dump.rst                | 2 ++
>  Documentation/interconnect/interconnect.rst         | 2 ++
>  Documentation/laptops/lg-laptop.rst                 | 2 ++
>  Documentation/powerpc/isa-versions.rst              | 2 ++
>  Documentation/virtual/kvm/amd-memory-encryption.rst | 2 ++
>  Documentation/virtual/kvm/vcpu-requests.rst         | 2 ++
>  13 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/accelerators/ocxl.rst
> index 14cefc020e2d..b1cea19a90f5 100644
> --- a/Documentation/accelerators/ocxl.rst
> +++ b/Documentation/accelerators/ocxl.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  ========================================================
>  OpenCAPI (Open Coherent Accelerator Processor Interface)
>  ========================================================
> diff --git a/Documentation/arm/stm32/overview.rst b/Documentation/arm/stm32/overview.rst
> index 85cfc8410798..f7e734153860 100644
> --- a/Documentation/arm/stm32/overview.rst
> +++ b/Documentation/arm/stm32/overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  ========================
>  STM32 ARM Linux Overview
>  ========================
> diff --git a/Documentation/arm/stm32/stm32f429-overview.rst b/Documentation/arm/stm32/stm32f429-overview.rst
> index 18feda97f483..65bbb1c3b423 100644
> --- a/Documentation/arm/stm32/stm32f429-overview.rst
> +++ b/Documentation/arm/stm32/stm32f429-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32F429 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32f746-overview.rst b/Documentation/arm/stm32/stm32f746-overview.rst
> index b5f4b6ce7656..42d593085015 100644
> --- a/Documentation/arm/stm32/stm32f746-overview.rst
> +++ b/Documentation/arm/stm32/stm32f746-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32F746 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32f769-overview.rst b/Documentation/arm/stm32/stm32f769-overview.rst
> index 228656ced2fe..f6adac862b17 100644
> --- a/Documentation/arm/stm32/stm32f769-overview.rst
> +++ b/Documentation/arm/stm32/stm32f769-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32F769 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32h743-overview.rst b/Documentation/arm/stm32/stm32h743-overview.rst
> index 3458dc00095d..c525835e7473 100644
> --- a/Documentation/arm/stm32/stm32h743-overview.rst
> +++ b/Documentation/arm/stm32/stm32h743-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32H743 Overview
>  ==================
>  
> diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
> index 62e176d47ca7..2c52cd020601 100644
> --- a/Documentation/arm/stm32/stm32mp157-overview.rst
> +++ b/Documentation/arm/stm32/stm32mp157-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  STM32MP157 Overview
>  ===================
>  
> diff --git a/Documentation/gpu/msm-crash-dump.rst b/Documentation/gpu/msm-crash-dump.rst
> index 757cd257e0d8..240ef200f76c 100644
> --- a/Documentation/gpu/msm-crash-dump.rst
> +++ b/Documentation/gpu/msm-crash-dump.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  =====================
>  MSM Crash Dump Format
>  =====================
> diff --git a/Documentation/interconnect/interconnect.rst b/Documentation/interconnect/interconnect.rst
> index c3e004893796..56e331dab70e 100644
> --- a/Documentation/interconnect/interconnect.rst
> +++ b/Documentation/interconnect/interconnect.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> +:orphan:
> +
>  =====================================
>  GENERIC SYSTEM INTERCONNECT SUBSYSTEM
>  =====================================
> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index aa503ee9b3bc..f2c2ffe31101 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0+
>  
> +:orphan:
> +
>  LG Gram laptop extra features
>  =============================
>  
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
> index 812e20cc898c..66c24140ebf1 100644
> --- a/Documentation/powerpc/isa-versions.rst
> +++ b/Documentation/powerpc/isa-versions.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  CPU to ISA Version Mapping
>  ==========================
>  
> diff --git a/Documentation/virtual/kvm/amd-memory-encryption.rst b/Documentation/virtual/kvm/amd-memory-encryption.rst
> index 659bbc093b52..33d697ab8a58 100644
> --- a/Documentation/virtual/kvm/amd-memory-encryption.rst
> +++ b/Documentation/virtual/kvm/amd-memory-encryption.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  ======================================
>  Secure Encrypted Virtualization (SEV)
>  ======================================
> diff --git a/Documentation/virtual/kvm/vcpu-requests.rst b/Documentation/virtual/kvm/vcpu-requests.rst
> index 5feb3706a7ae..c1807a1b92e6 100644
> --- a/Documentation/virtual/kvm/vcpu-requests.rst
> +++ b/Documentation/virtual/kvm/vcpu-requests.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>  =================
>  KVM VCPU Requests
>  =================
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
