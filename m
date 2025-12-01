Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE72C97DB7
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 15:31:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB93EC628D0;
	Mon,  1 Dec 2025 14:31:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32096C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 14:31:45 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-477632d9326so26551135e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764599504; x=1765204304;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P3Udye7A+1mJEIOEFZOxhVuAe/sJ9GEaxJR6U/sqIe4=;
 b=huacjh/pWGUQwsVzlwP9E2KSE/ulbFrLbTegeoAIcS+gAxpnWazLwz2ezCSdkMW2BD
 kxiuJ1TJuirFI0LRswB3RJxKG4M6gcJ1CSAkav6UsUeSXvCQDFSO9q5GEj/oUDZXlwfS
 5dkrv2q+a6nTP9ZTElcl6U0DSaWZ2qQSgccPf3ciMdbgwrBpuBvldk3fc4KDo83P+M0j
 1lNT6aKOEsqxNwslRz/VZrTUoDkwCPNH8DE9h/TNNpBa0IXntXHo+Y12ck1RkCpLemfQ
 DX+N3HsLb1WjSc7Mhox+V+eG6ZV3MHizIbo4uOKySiF4mBZN7m8za8KdFXD/boR68V9u
 yPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764599504; x=1765204304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3Udye7A+1mJEIOEFZOxhVuAe/sJ9GEaxJR6U/sqIe4=;
 b=bbdqsf+GA+V20vvV32bbeOT7cvbqUMNkkwvLNkDJS3jtwKqOSkkNeEMMLOozSuI8LW
 5POIMl8VndvJyV6s7jWQAhdpOXy8ODxjWDsPAXAHXd/MGvLClBSB+aVEhYCMCIeNNUQl
 EJtlCHxOEntd1Mmsi4Fv9ARx3tuzzsKru8BGx3o2x+fHtFf54RC1UasJQNnUn/K6hYJ3
 Uk2Ilo6m8dy2rjuuToOWQrU7awFMgXTFmoe/Xy1PiHCrjH9wgAw2RYbzg+vy7tu0Upf0
 9KTom8HwOuMO2pG/a0A4+IAml6iphCMonX2BHds28Pu2k44pqyAzCyeezPygy8hsDBQ7
 wWRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpPMD4PyWXPQ9y2JzXOB/jZ5Jxbk1JumpAkrPfBjnXQKXg40UGTN+DR41K8rnsr6zAkUYpQairJVWG2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yye6mkd8vZNmi5pIcfteF30mK20vhr9kMoqTuYZ+IKYEctKLQW0
 /6vH1hcZoNkjQ87noc5NK573/G06xGR1wMzXpHcEZ/Sl+ARX02HJZK3BGolUcNZptuo=
X-Gm-Gg: ASbGncs6HNHZR9djdpQKud60eicJCFa5BHV6+OkkvtDWaPUgKBKIjK8otEQmNU2xjl1
 DNHsphw4F0W4Cp1+YxrPb/9iik7mzOvLBhv7hfSjifBEhPiq34M23eiVf9SUt9bGO2wF77S+bvM
 siCFpgEAub+8LMcpvQNhQtI12TppYZ/uIZPn7aSVBb81MTbznt4+m1zfHvDk9YIHOuSDSA3Mz9y
 buv/EtVxWNn92Kftohj3itx2ncyY7+MU+JWCXTdxhQ7jbbws3c6cK5X7xtkAwD8goItGVEkzz2y
 DJPTXwSGfRKImBVwS9oUDN9js5tEPjuzHesNcdDHOusN0qS0Fmhr+yMwJyVNNy7ygNz4Eb1DhKo
 nDGckKu6QcjXCOZpbJSnFKRuD6ELNtSC5z3vmmR5ceWGhkPn8NIomtU2A7Cmll7QzVSnW5b0VUg
 lIRDk/s/cKQiE3F6oh
X-Google-Smtp-Source: AGHT+IH6A6FJXGfT8Zsjwa2/f7hPiOGak401pIC2WoSIqlHjuQJJxsh60eESxFQX7d8Tr6L3Wxf8Ig==
X-Received: by 2002:a05:600c:1f8f:b0:46e:1fb7:a1b3 with SMTP id
 5b1f17b1804b1-477c01ee3camr380965655e9.23.1764599504416; 
 Mon, 01 Dec 2025 06:31:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-479052cf8d9sm154964375e9.9.2025.12.01.06.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 06:31:43 -0800 (PST)
Date: Mon, 1 Dec 2025 17:31:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Message-ID: <aS2myhp8asABFyLt@stanley.mountain>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1764592300.git.dan.carpenter@linaro.org>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 0/4] s32g: Use a syscon for GPR
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

On Mon, Dec 01, 2025 at 04:08:14PM +0300, Dan Carpenter wrote:
> *** BLURB HERE ***
> 

Sorry, I obviously meant to write a message here.

The s32g devices have a GPR register region which could be accessed
via a syscon.  Currently only the stmmac/dwmac-s32.c uses anything
from there and we just add a line to the device tree to access
that GMAC_0_CTRL_STS register:

			reg = <0x4033c000 0x2000>, /* gmac IP */
			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */

But it would be better to have a syscon instead of adding each
register to the device tree like this.

We still have to maintain backwards compatibility to this format,
of course.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
