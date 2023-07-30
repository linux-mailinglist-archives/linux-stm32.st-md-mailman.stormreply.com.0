Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E197686D3
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jul 2023 19:47:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADCC6C6B470;
	Sun, 30 Jul 2023 17:47:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0B40C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 17:47:13 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso4995868a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690739233; x=1691344033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IrOgs61XoD6nvvo7RE9vpo1zP/qDlQlSvbRMk98MHmE=;
 b=lLAQYQmQybExgDwErsMMs2tiRFkJcqSBK4ZUfoDM5/qlY9wW8yMHznQs/eWuXnm+uU
 dr0ZyedzRJuD5XXTWxjcGy1Pqvk3doIB4JqYfwtTZsfoNjwjRSWGbSMQEtZOZ7jcC04S
 lp+JtVR5p3r83Sp65/kBfe9D6Kf5UNi5EGEG8i6uTPlEj/pk9uH+dRLBFAM6DASb28DO
 ZUNWo9WofF+Os1cfsFTL0/O/QFHoL7kq0vGY6d/i4RWdM3eAZwcBf4j+VTF1N1f6N5Fz
 LQKjm9JQdjHpsGdyxVMCiweuHuBuH65EoVgNlipbxx3GHXl3265JwVou/e0Sn+WhOJV4
 Byeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690739233; x=1691344033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IrOgs61XoD6nvvo7RE9vpo1zP/qDlQlSvbRMk98MHmE=;
 b=Efp3Rpufi2f8dCKEbPKQwpD56R4B1waF/l/DAcGQAZPzlbop1a4gRvQcvESYD44ZhM
 NtkxgqK/lorX6xHSaHbEj7FnfJgn2+nhTS5wpzH/vvzw20tx47lK7RQGR4X8YSodYuVe
 B6MwHIcqi4MWOBXqTugBwqOGwPKXqgnzs/ahwIldPudLMr+Go7/iQsCGCZ7CpxRVrqEj
 gjNfM/IZbbHXOYrknCW+rKACCf+GfC7UjmHUvnGW0h5E5gO6W2x+Ec+zh3JVcdQLpLLr
 gdFr99NT91RWIHi3d9NXcCFdR8FWrDTMPfKuUNXyBv/JUNiBlwIEN/y8jkvAbckV/cXc
 JkHg==
X-Gm-Message-State: ABy/qLYYU9nmK76utbsHVseQY9zCndt6sbDsAH2crep+kqZUucTUUrLg
 jd+jkCkQqKxUrlKujeTkj64pQw==
X-Google-Smtp-Source: APBJJlEBjOqJner1DTxmBIEUGCo5UvcdSUdWwZw493BQF113hSPsa5smAwjJGJIIU8/Tu7yNtMOmmw==
X-Received: by 2002:a17:906:18:b0:982:7505:fafa with SMTP id
 24-20020a170906001800b009827505fafamr4312331eja.47.1690739233011; 
 Sun, 30 Jul 2023 10:47:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a1709064e4200b00992025654c1sm4985351ejw.179.2023.07.30.10.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 10:47:12 -0700 (PDT)
Message-ID: <69ed96c2-17d8-7362-cf61-93e895e22ff3@linaro.org>
Date: Sun, 30 Jul 2023 19:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
 <20230730134446.GV151430@dragon>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730134446.GV151430@dragon>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] AMR: dts: imx6sx-nitrogen6sx: drop
 incorrect regulator clock-names
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

On 30/07/2023 15:44, Shawn Guo wrote:
> On Wed, Jul 26, 2023 at 09:03:15AM +0200, Krzysztof Kozlowski wrote:
>> regulator-fixed does not take "clock-names" property:
>>
>>   imx6sx-nitrogen6sx.dtb: regulator-wlan: Unevaluated properties are not allowed ('clock-names' was unexpected)
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Fixed the typo of 'AMR' in subject of 1/8 ~ 4/8 (Thanks Fabio!), and
> applied all, thanks!

Oh! Thank you for fixing the subject.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
