Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C68567D728
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jan 2023 22:03:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C46DC6905A;
	Thu, 26 Jan 2023 21:03:12 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5896BC69056
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 21:03:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1383C3200977;
 Thu, 26 Jan 2023 16:03:04 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 26 Jan 2023 16:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1674766984; x=1674853384; bh=WrcQCPREYu
 exE+bSRUWehMh+31rnbUdZUAUeCq+X5EQ=; b=FsgImuYqVdAY6hA4khfZyuZ588
 8+/NO5deukjqXQXbOT7+8WCd4SwSySkPxbHaDH5kExAs2qrlmzdD1ZcB6fKex2s1
 7j4tibaMvYpv7fWkOBhR/nZkP+a3paj2Jdm1kYrV2EtXN9VHlxWaGiEPsaDKgDzd
 K1vtAjdIDarLMQTBeucmnrIc6jTHBKOIZDRxcUglQqY/JsbzsCJ65KbVe7VJB4de
 9FP4NTnmOQpmQL/j73G+fcyM3ob71VCn13XQFtgf8NjfLhw1X4R5FvsLxfkFYhDc
 0o1LM0pUt5H6l+RseKQZ4PPc3cpYIwc9IUwyzqFDcm5WORvpj4o9dA2A3AKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674766984; x=1674853384; bh=WrcQCPREYuexE+bSRUWehMh+31rn
 bUdZUAUeCq+X5EQ=; b=o0V97d1b6TZ34cN2bFdVEmXD1wdcZShcPeWYGhhFF1Qw
 Uz5LKCbImuiwFOxbewUa24HMEJzTCf3Oysltsj0PHxO23gEAEbRb3IMIIAqdVEWI
 bEcMbS/AEOKVKoDkYDYEudwSOynHuxedcAwAxmhccVJXB521CLiMmn5PIhkt1OFz
 C6gZv5cIwaUajJEyuy/tcyfZZx88E72fONpBPFOhdERr3GpNCddGS5jNXRNOH9Uw
 pdgYHDdFwxp+zBsiRx2lWfPNeJL2rGMh3GA9uhogYirPFuGSkLbgv8nOxhgDE2bG
 eems64RMg6EGs+rfEgVXNelDzluPxoRlslp1/oWDHA==
X-ME-Sender: <xms:h-rSY2ZH66UQzp2syEzlZZW7gVCMlLeefnOgOCw9neuQNTFvAMy3hQ>
 <xme:h-rSY5YmUZWtyG3jGvHdcSgShcM4x743DrthUCVxB1-nO-5v0XgaqhnBk7wVld-iG
 6FpsI0D6JE1M2TIPUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:h-rSYw-K4BmPuY5VinRfLrf_w26fzNbzadaWJtf6UOnJSvAs_gBRcw>
 <xmx:h-rSY4quW02Gdbl6SAWwBuo0SuY9vdM15XKTbhXeuafY2KKjaFpwiQ>
 <xmx:h-rSYxoRVR4HnB4qg5uQCB9YH5MPAo8L_PiCQVzlhKCezvmyLXDehQ>
 <xmx:iOrSYyQ06xloNcfR-gcNTwLCXjWhOhtdosjUY9xSOKuotyjB4MFSPw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CA682B60086; Thu, 26 Jan 2023 16:03:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <077f90df-0e0b-4844-8492-1d825262a0f6@app.fastmail.com>
In-Reply-To: <20230118172940.841094-1-patrick.delaunay@foss.st.com>
References: <20230118172940.841094-1-patrick.delaunay@foss.st.com>
Date: Thu, 26 Jan 2023 22:02:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrick Delaunay" <patrick.delaunay@foss.st.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 0/3] nvmem: stm32: add OP-TEE support
	for STM32MP13x
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

On Wed, Jan 18, 2023, at 18:29, Patrick Delaunay wrote:
> 
> +config NVMEM_STM32_BSEC_OPTEE_TA
> +	bool "STM32MP BSEC OP-TEE TA support for nvmem-stm32-romem driver"
> +	depends on OPTEE
> +	help
> +	  Say y here to enable the accesses to STM32MP SoC OTPs by the OP-TEE
> +	  trusted application STM32MP BSEC.
> +
> +	  This library is a used by stm32-romem driver or included in the 
> module
> +	  called nvmem-stm32-romem.
> +
>  config NVMEM_STM32_ROMEM
>  	tristate "STMicroelectronics STM32 factory-programmed memory support"
>  	depends on ARCH_STM32 || COMPILE_TEST
> +	imply NVMEM_STM32_BSEC_OPTEE_TA
>  	help
>  	  Say y here to enable read-only access for STMicroelectronics STM32
>  	  factory-programmed memory area.

This is now causing a link failure with CONFIG_OPTEE=m if
NVMEM_STM32_ROMEM is built-in. My guess is that you saw something
like that earlier and someone recommended using the 'imply' keyword
without understanding what it does (no worries, nobody understands it).

I've prepared a patch now based on the most likely interpretation
of what you actually meant here:

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index ed8ef7460be2..ae2c5257ed97 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -295,8 +295,7 @@ config NVMEM_SPRD_EFUSE
          will be called nvmem-sprd-efuse.
 
 config NVMEM_STM32_BSEC_OPTEE_TA
-       bool "STM32MP BSEC OP-TEE TA support for nvmem-stm32-romem driver"
-       depends on OPTEE
+       def_bool NVMEM_STM32_ROMEM && OPTEE
        help
          Say y here to enable the accesses to STM32MP SoC OTPs by the OP-TEE
          trusted application STM32MP BSEC.
@@ -307,7 +306,7 @@ config NVMEM_STM32_BSEC_OPTEE_TA
 config NVMEM_STM32_ROMEM
        tristate "STMicroelectronics STM32 factory-programmed memory support"
        depends on ARCH_STM32 || COMPILE_TEST
-       imply NVMEM_STM32_BSEC_OPTEE_TA
+       depends on OPTEE || !OPTEE
        help
          Say y here to enable read-only access for STMicroelectronics STM32
          factory-programmed memory area.

This enables NVMEM_STM32_BSEC_OPTEE_TA whenever OPTEE is
available, but prevents the link error by forcing NVMEM_STM32_ROMEM
to also be a loadable module if that is how OPTEE is built.

I'll send that if it passes the randconfig builds over night.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
