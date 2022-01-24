Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283F497C37
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jan 2022 10:41:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8543C5F1D3;
	Mon, 24 Jan 2022 09:41:51 +0000 (UTC)
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32D17C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 09:41:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F2A5358011C;
 Mon, 24 Jan 2022 04:41:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Jan 2022 04:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=8x6bDAxpoAORAyNxrYSGktt9aYhf6Lgv0WZx5W
 /s0fA=; b=hpoWvlxblC+aw669EVxhTx5CWQIsYMnD8uZ/NebCPZCmIHgNUjOZNH
 RljPmprtslMbrXLJNtr4JdRu2luHst2xW0R3bjzxY8EUrA4L3FLa870/cvCo5keO
 9kRkZech5b95YNcd02bFSzdMx8NyG6U3YL+tUfe7lPWaPl/d7CMTUODyuzbmixWE
 S/noLE3I/mtphpq1QCa0yK4MqWD2Vj3EcV4GVusVNqj6qxObB/DGPf+eWrRz/tZN
 sam0U+N03ZeNqQL/XetgiOMI0Q/+0eL0BBig0SxwycAzNyDbWhJJzB+AnZRVa4f0
 xa+gHo548xRUaTGSEps3czLePldAhPag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8x6bDAxpoAORAyNxr
 YSGktt9aYhf6Lgv0WZx5W/s0fA=; b=nUE/R9LZ/u4Mgn8/mM53gbPZPmg/Nad6q
 xsRHZ3cRjJwg2O1ujPPRvmU8uZVbrx2Fo9Vwmj939z/YxxB17fukmVhjCrzqLjtE
 uuJZkrawwdOjzH1V8fU4N2F2544WvVQcVj83r16jqirs3nNDJ0SZK0VpL6K0+Wvl
 TmA9JlmHsiFItyH5kBiEc4NDjYe5GBeifDGBWsevyCmU41wdIX4KPyX52LHxb39D
 oe+RPtLzwjgsoBCq1//+DhyCelOFpViM+2/xqfjzrRUcVuDRd01T/zQRallcj8Lp
 VqEkXtf4D8/pJW24q1facACeYmqDvfwRCxmougFPE13Id3Jn7KfDw==
X-ME-Sender: <xms:W3TuYQgfOYvznWfoe2KKVv6n5tPgU8EKsMxXl74WYB3T0nwqW_TvxA>
 <xme:W3TuYZCCiWxfrhIUEHFLXkhZw756SKW1jucua_6mbBZh10RyAIAKPo_uIcRz5NvYo
 rEZAcMGO4L40A>
X-ME-Received: <xmr:W3TuYYFP-vVlJ8BUceiiTFNrHIcDH0mHa_i6iJ2q4uUeVDqzWeflxn-5QsXtKHpmiDESZYU7UoLk2cJ6MynM2cBtz6LFSun4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdeigddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
 gtohhm
X-ME-Proxy: <xmx:W3TuYRQs0QxDwG_AdOX46ejOxFjGV1U4CAwxBmW28y2cA7RvaY-bmA>
 <xmx:W3TuYdyAXZmJFOLPK9vOtRUmXGdCXHp1UdvIUqwR57i_mRUQAMNaUg>
 <xmx:W3TuYf4hTGIq2i1ctypBXwmEyC2DD-58QM91wFkGN_G9R1XrxKlx2g>
 <xmx:XHTuYepOxczp1KDillIfd6UBJ3sj9g5ja5ETenX1IKbvzRVzjAC-sg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jan 2022 04:41:47 -0500 (EST)
Date: Mon, 24 Jan 2022 10:41:42 +0100
From: Greg KH <greg@kroah.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <Ye50VjsyOdhxN/9W@kroah.com>
References: <16429542415161@kroah.com>
 <20220123162240.5532-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123162240.5532-1-marex@denx.de>
Cc: Lionel Debieve <lionel.debieve@st.com>,
 Nicolas Toromanoff <nicolas.toromanoff@st.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, stable@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32/crc32 - Fix kernel BUG
	triggered in probe()
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

On Sun, Jan 23, 2022 at 05:22:40PM +0100, Marek Vasut wrote:
> The include/linux/crypto.h struct crypto_alg field cra_driver_name description
> states "Unique name of the transformation provider. " ... " this contains the
> name of the chip or provider and the name of the transformation algorithm."
> 
> In case of the stm32-crc driver, field cra_driver_name is identical for all
> registered transformation providers and set to the name of the driver itself,
> which is incorrect. This patch fixes it by assigning a unique cra_driver_name
> to each registered transformation provider.
> 
> The kernel crash is triggered when the driver calls crypto_register_shashes()
> which calls crypto_register_shash(), which calls crypto_register_alg(), which
> calls __crypto_register_alg(), which returns -EEXIST, which is propagated
> back through this call chain. Upon -EEXIST from crypto_register_shash(), the
> crypto_register_shashes() starts unregistering the providers back, and calls
> crypto_unregister_shash(), which calls crypto_unregister_alg(), and this is
> where the BUG() triggers due to incorrect cra_refcnt.
> 
> Fixes: b51dbe90912a ("crypto: stm32 - Support for STM32 CRC32 crypto module")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: <stable@vger.kernel.org> # 4.12+
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Lionel Debieve <lionel.debieve@st.com>
> Cc: Nicolas Toromanoff <nicolas.toromanoff@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-crypto@vger.kernel.org
> Acked-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> ---
> Backport on 4.19.225, likely works on 4.14 too.
> The patch likely failed to apply because the hit 5.3:
> fdbd643a74efb ("crypto: stm32/crc32 - rename driver file")
> and renamed drivers/crypto/stm32/stm32{-,_}crc32.c
> ---
>  drivers/crypto/stm32/stm32_crc32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Now queued up, thanks.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
