Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0859D225B5
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jan 2026 05:11:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CA76C8F282;
	Thu, 15 Jan 2026 04:11:47 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3733C8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 04:11:45 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-81e7477828bso241260b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 20:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768450304; x=1769055104;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xP2VPIUiLJoH99MGWGrtf+rn+/TD63H55qh3heQER8c=;
 b=Rl57NYQ4ySYU0K8gj9EMsJMRS4XfpVhNvT65G4nRFmy1hMP/vyjLdscDRmjQoPYfuy
 FmZS12b+34K798/oIF7cXJMz64GZmfmHXc06nb+yA1OvVvp0DK2i6rRiXb9zLnWxZe4k
 kKRJdUupjO3JcUExMrtIvnL9/v18k7kfUdVI87ji5jJ6d9xiVmQX9IlmDT/Qv1V0zChd
 U6sKhVsBfsjNjylN+RP43+5jRVwL8pIkJzGKZLqGnJ2e9n/DMv4mAiKqyv07cEe0OWBf
 +aA+XV1O2AVtGbyAV/uzCJNP0+p2Tvo4/sCnWKWMVBr7AEVPBtKwFJZy9Y3DvdwtHf4T
 UX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768450304; x=1769055104;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xP2VPIUiLJoH99MGWGrtf+rn+/TD63H55qh3heQER8c=;
 b=GGcHadeyKywlmARLOoLqhtG20ESyEmaK4Kx8b/+0eS8mWR9CY8uCo+VbIQ+8RfRoyD
 EhiCdGF4EesRi4N5K9Hn7ohHkzmHpTsHUMWaDW+0zJCwTXxY52awSqfQ6DUUGzrutUur
 ycj7sQy694rWicwbkvQcShkH14lP07uaQcXn3dTGsXrovQM4+4qlizsvVNGz2MzLORuD
 raCR+zPVC+HSErtGIctV9X1qrrCFAFrAbrPtU0GjaLwHI2QaSA2GM7YVvlEBXo4JQxIi
 MdE80xsckLOKCGXLA9N1vcOY0CKnacILeIT3+eH8C0EGLmmk9sISDpgd+UDAhVPc5Nqz
 w0Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaxjBo/4bl5zXjeRRUZpsIKev4jhaQ1eLfZsENYJC3RuDsKr/prt74pTKid8ovF20hjzwaPyYXIHq0cA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yylytg17jdBEbnrcmFfIfCDQkKLlJ3k4gMSg8J7ZhUf5zdhATMj
 +9YuKnpZdE+zcPxU/rQJld4Fa1E/zz0xfCRbsFvNxiAZstXdbOix2j6z1kqKwpdaZNE=
X-Gm-Gg: AY/fxX5X8uwl1rd0zW7086OPJL20GkDjVHkbrukTBG9WKT0HLycxX1Y6rBB33FsUBWW
 pipSzJ3h5VX2PyvgILmDELifd4XLlgP3C6Ava7DICuiUbm3AFkocuAfSPG1EBUvN/loXh2N0rV6
 9uADUm9wcA+MFEdb2DZwTzn10WgueJobvIRWO5WTX2KfOEM0q9waqe7WeKRttqVoaYsadpFIkBg
 lA9oDaUfr2ai+B1haVRBY4q0c3ZFXKPRopqKlvlFT80lOx5E9nl9hdChFg3kOySF0fUxtxczcDg
 aXv8XXkFWnImVcqKMUz+Lv0N4Vupid2KUBf9PrVMUprFQQYCkw2WwLLw2/SgIYWuNF+cZFrYlTr
 fECqal+aWYqvFAsNFv6LZ6zKDzln6LCUBqyOTHLz7+guJ/o0/g2dJ92pPs3KIiOJ8dYgHQxA5nT
 9WkXw4nzPQFcw=
X-Received: by 2002:a05:6a00:886:b0:81f:413e:5b6c with SMTP id
 d2e1a72fcca58-81f8efaca14mr1910211b3a.5.1768450304213; 
 Wed, 14 Jan 2026 20:11:44 -0800 (PST)
Received: from localhost ([122.172.80.63]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f8e4f19c5sm1038158b3a.23.2026.01.14.20.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 20:11:43 -0800 (PST)
Date: Thu, 15 Jan 2026 09:41:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <idqqwx3svrauv3e26dce4uofevcyd3a6lltsjvpeovp6nse4le@yqym3jc25xr2>
References: <20260113201340.36950-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113201340.36950-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, soc@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] arm/arm64: dts: st: Drop unused .dtsi
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

On 13-01-26, 14:13, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Reviewed-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Drop erroneous QCom .dtsi
> ---
>  arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
