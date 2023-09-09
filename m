Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CE7998C6
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Sep 2023 16:28:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36678C6A615;
	Sat,  9 Sep 2023 14:28:23 +0000 (UTC)
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E277EC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Sep 2023 14:28:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 129102B000BF;
 Sat,  9 Sep 2023 10:28:18 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Sat, 09 Sep 2023 10:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1694269698; x=1694276898; bh=2g
 tIrsNeic2vvbi63w8W2QWQB4mScZHdrnV/QA4eNl4=; b=YafaDm/GeG2cO+vffD
 w2B7TqoPfMIWfEZ8TZ0WMWPQhRN0a7k+yLwl8wVN2K3JO8EMCzgz9AeR9PWnQeyb
 m7de1lbuWheZEgb2JuEdMav+LSzXlBAwcwRoXaK2m/GvJk9C+FS9/e9+oEu/Zre0
 hMzKE7WTYmaloSi8mbeASXRe4NzNfgk1CTYjd5FxMuNpPf1k/HbwXTeTMszRFswr
 DOhExVQCOn0oRXpx/q6d60N2y+chPbVFKQyak0hj6JslWZwsf+5KTwIe6XDDX5jZ
 Dvwqami3JJoiqWI8dY7KdX35bpkI86RpyVHwCgxWyeaBViSp8eLb5Os/T3cSqEk9
 thog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1694269698; x=1694276898; bh=2gtIrsNeic2vv
 bi63w8W2QWQB4mScZHdrnV/QA4eNl4=; b=YaznKN+hzBj6IkM3ZTURjSq7RKkfq
 k+NqaovWLToXXUvxV1PUIcHxh61XRqFEIV20aop3hRTXQK2WLmQXriVeAvOgBv5A
 V1E3JGAIeAhGAJqGrSvhPWl5yGdlf5XcdPtdCRGfnaZwNNZwwBEuG5+e9ND67/t2
 M2WBqyoFhUvpjdV9ggAEo9LhGj94uTo0UnrMvEx1UCr1Hn9NtzGbxZEZ9dzwONzE
 Y4vJoUvTjHeOu2ltb1Y1eXELjEHI2VfJhZ4v1JSLjicUeCxR1FRcDVtblMW7Bjqx
 JTZmng1BmUVEmhe0F+U2BF5BbEyD8tzCc0OGzkWnw+9vVbyufGRwrSIsw==
X-ME-Sender: <xms:AoH8ZJD3XspTGJcF1RPxyJ_pKAAZpwr0iiu_RHyOD-IabjaAvt9mrA>
 <xme:AoH8ZHjkkN3V4RY0PSkTrEBkUZZlVnKvCRmMHciUipb6vTLpvrLLlIdxS4b7nZheD
 nQ_85NBc6JZhTte4_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehledgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhephedvgedvhfegteejtdeggfevudevhefhgfdthedvheeuffeutdeljeeghfeh
 vdevnecuffhomhgrihhnpehsthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:AoH8ZElv9SnlKQWwOu3RLeaFBO821xL-nfkvLe7YErY3tfZy0dEZlw>
 <xmx:AoH8ZDxkq4lEVu7YfYQjKOwhMQLcHyPuuQfpdyEsdl5arGGWCrcRPw>
 <xmx:AoH8ZORZm0VHLsdrF6_ZdiK4aWh-v7yhKzvMJPJC18ggAEBWDKLiOQ>
 <xmx:AoH8ZBG88pbx0p2iR40VYHj800zLtPodEBR0O29_2GV5cF_DrHDbtWZQsTw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F0C19B60089; Sat,  9 Sep 2023 10:28:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-711-g440737448e-fm-20230828.001-g44073744
Mime-Version: 1.0
Message-Id: <738c3b54-1f42-454a-90be-505ceba7544b@app.fastmail.com>
In-Reply-To: <20230904180513.923280-1-dario.binacchi@amarulasolutions.com>
References: <20230904180513.923280-1-dario.binacchi@amarulasolutions.com>
Date: Sat, 09 Sep 2023 16:27:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH] ARM: dts: stm32: fix SDRAM size on
	stm32f469-disco
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

On Mon, Sep 4, 2023, at 20:05, Dario Binacchi wrote:
> The board is equipped with a 128Mbit SDRAM.
> 128Mbit = 16 Mbyte = 16,777,216 bytes = 0x1000000.
>
> Fixes: 626e7ea00215 ("ARM: DT: stm32: move dma translation to board files")
> Link: https://www.st.com/en/evaluation-tools/32f469idiscovery.html
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
>  arch/arm/boot/dts/st/stm32f469-disco.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts 
> b/arch/arm/boot/dts/st/stm32f469-disco.dts
> index cbbd521bf010..f173a5892b7d 100644
> --- a/arch/arm/boot/dts/st/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
> @@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {
>  	};
> 
>  	soc {
> -		dma-ranges = <0xc0000000 0x0 0x10000000>;
> +		dma-ranges = <0xc0000000 0x0 0x1000000>;
>  	};

The dma-ranges should be independent of the installed
memory, they usually reflect the addressing capabilities
of the bus, so this patch should not be needed.

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
