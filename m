Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB88C09E5F
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Oct 2025 20:33:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC98BC36B2A;
	Sat, 25 Oct 2025 18:33:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBF4CC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 18:33:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so6512555e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Oct 2025 11:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761417220; x=1762022020;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=njapoqUW468MWxICa8jRinTKfR2SVCoFBRR2d+cCtuk=;
 b=Ax8dVqbkjbXi3vNstH4Ta0TYNSXRtJFhaIXG8mxZaiBFtyBrKXl16guuntppjkgak9
 8tqy2TC3O8RwXrFG6jASkp0vBJNBHof/8utTcw/xc6jOfVlAlDDl7awQ87Hk1kORje7v
 FhvPrA3h7J/tw2LSX0zwnBVD6gXPFLpgHdWfElXRAw/td6vMV6cCQY4xRS0UzqxJoog2
 6n8wwoHmrvBVbSYaESfMV3TxMDE8le9CTKhrP31/t9EUM1rleHJ+VMFtxV6riNIz2k6h
 jQ8JS0Sd2cN2+8aL5bhsWeB29TEIXddv+ZeSQxNa5HcQWe5ZA3wxdBPMd9iRmAfADmX9
 U3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761417220; x=1762022020;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=njapoqUW468MWxICa8jRinTKfR2SVCoFBRR2d+cCtuk=;
 b=F+tItUK+80JD/Wh9X5GlsKcx9vXr+/XGj49iNmg6ToZF+MpHWJ541TJHmNjcEEmsHV
 nsYDK1TB8UNBzAxR+t4hZ78oPoh/Zro8gpPpj711qfrEmFXTVAYcSCKqnU7JTg9g71ei
 aKzVOouVSW8uA0c9ICZ3N4N9QduHzOEG7c6rjgetIqi02Ktzghzi0/b/5smF82RKFYmP
 aUIgCrj/DJ6BPODllYkvwwxRyyJbAd874mcJFRGasz7UQ8SFW8QvgMR3x4pEiyA133ke
 SQjkjCiHY3E9qHGBun7E+8b4/fUhGf5BIosIiN9eBSaYzSndwhSjP3Iquu5CNU6pzuvE
 qWLg==
X-Gm-Message-State: AOJu0YxKuzq05Af+kzrRi4jMDyTc04Hb57eSJBYbG7pWJLZveRV2GqiG
 GuchIRl+AGfnawCogSkIrME0dwEanjNELnDrY9ptO/gfS4XNZkTOQ2yV
X-Gm-Gg: ASbGncsJXO7WoR2k2PCmzAJGpq0vLEy+ngqwDNk4sogrmxvl0LOr37nnn1Oc+Bki5zr
 H8hQANHNox48m02Z+I3ZIYvtml1PN/TUSOoBY6EvoOVZLxYSWkv3/vYQ4N2k1MoSXKz07TWb3q9
 pag8iwP76FVoYCehUwFuO1AB2/fiNEkMCF4f/ONPWiVK07F+T14Cjw578IHjnIJuCu3H4jfcIEH
 upl0cOZpBEWKp8tL74OFlQV0t6JbzC7BDa8A4FpNAcxTswgm1gT/Mav4jo3ZprDF2xiww3AwgD6
 2lBG5o8DpsGwTg+xXuo+1ZgD5uj16Dx+8yF1owiFqnN61CpbU665Efjda8iSlCG3iU+vubhpx+c
 z7EztENxja2cacTPeNowDrtKcjgIlv+bDeGfFkUjyhG4+SkhgEoOxLgvBtYd3fUt6VDhlTJk2Nl
 DlMQ5LFsceODSiPIjYziCbOQKq5ZcWKTjI2LBMo3THQkziURy73XtnQ5+CFwNc/5sMSjM2Ik9H7
 c317LmBgcpU8JAxdSq8SKheu/urBY117D+SE5aKsrQ=
X-Google-Smtp-Source: AGHT+IG+DDe5oIMet8KWoLY/Yop7b4xsXXWiOxNNIX75KW86rgVdoPT8ZCbdmaSertyJd08nHYeHmA==
X-Received: by 2002:a05:600c:1c8b:b0:475:de80:bb2a with SMTP id
 5b1f17b1804b1-475de80bc38mr21178885e9.35.1761417219771; 
 Sat, 25 Oct 2025 11:33:39 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e?
 (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de.
 [2003:ea:8f39:8b00:d401:6211:9005:e76e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da12dsm5012085f8f.29.2025.10.25.11.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 11:33:39 -0700 (PDT)
Message-ID: <2d840dff-60d1-4b7c-bda8-04704fc4c81a@gmail.com>
Date: Sat, 25 Oct 2025 20:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>
References: <8335ad5a-f5fa-4fb6-b67a-d73c4021291a@gmail.com>
Content-Language: en-US
In-Reply-To: <8335ad5a-f5fa-4fb6-b67a-d73c4021291a@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: fix smatch
	warning
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

On 10/24/2025 9:26 PM, Heiner Kallweit wrote:
> max_addr is the max number of addresses, not the highest possible address,
> therefore check phydev->mdio.addr > max_addr isn't correct.
> To fix this change the semantics of max_addr, so that it represents
> the highest possible address. IMO this is also a little bit more intuitive
> wrt name max_addr.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: Simon Horman <horms@kernel.org>
> Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

CI complains about the patch title, so I'll change it and send a v2.

--
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
