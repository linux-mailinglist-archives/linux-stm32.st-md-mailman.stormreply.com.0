Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E99A9E45C
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 21:17:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C4A2C01E99;
	Sun, 27 Apr 2025 19:17:52 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40984CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 19:17:51 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e8484bb895so1083041a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745781470; x=1746386270;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
 b=brtJyuZzkSr1rEhJzpR65fl9tVSLn7rUHOO9bx3DS6/5MX8HQQ4ZwPXytdV/aRHWrW
 lDcaeRrbyse4gvbITJtwymJwotvjtVSeInqZcFo/0aWbbMWNhrd0ko1l4INHwscnD0Ls
 hAZ6tSL0UhDGUVxpl74dQcZq5yX9P/KCsEMx5Ve6dzp4Do+nX5/r8iBXY1lwAhES7XZ+
 6CKsF/55WgIKS5pKRLJy8CXFQyg3ZvHkP+XfwkDlvx8vyZsT11KtrJ2yYf43b+c+Jc6k
 Wm+utIcvN2/uZQzDvx66UunBlP87lDoclSCuFQeDvCKfzkb6zYYx33TlX2mX5RrAxWae
 JfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745781470; x=1746386270;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
 b=ZyZQgSwfIDBmNONs5g4/KvYQsxTeTO/BoQzIj8ziXaIZUpTlfW/nNlb7CbBi+IkWD+
 OdgjF+Q8VReLD5MrkRiCigmMqPQpkRIWl1M/Re3RspYkNhxEon0paZSde2wzQnFbzD73
 AkF2qsHDvz4xqC/GY8wOPVmvBUNMW+x6nCgObMVHlAUEue1go0srPiyhZ7S64EpsPd+K
 CCFQocmyOwLDoaJp4uA5kz27j6AkFwQ9n9OI93SqO7q/ORxehWlTAD/kditepV+HcwlQ
 sQh4UPib3oN3mByJDWCODK+MkwdS1vvzVkC9LgEgVEseK3eblPJetSKl1ZUGEwoO2uT4
 iqYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEMZSers0une6WzyhWi+BaDISAdUPn7VytrINK+TF2v2vm74zwX3v9WmiMgK5Vo/paQerqoJPHs6wlGA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwbVb36dn/Xal6KHfYcNdjVE5uDlXUXcTNWlrLcs3uJmdx+NkyL
 EFAN94Y0d8oYtsnlFgcOwLzdfZtdtznCKMG6RiCTOTZMY6s8J4zcGWsq65w10Q0=
X-Gm-Gg: ASbGncu8Y8dx9dLdKh/y6BSU6SRAcjv5cqNHapCaN3hFYhcuEzvvSAEUpmHReQki5p8
 fQZwyySDjf8qDR3FCBGSqukWsRWuU7t3KHTYwoXaXg8YHcsGA2hp2LekeMF2zN5zex6Uny0Pe00
 7LjEZKRStV8kXtcXeg4fIIEweN26zcdJuQcpxb9k4uM+lPm2fPDIsmkuuxxOb5P+47DHjQc0nTZ
 5518IeWrxRMxYnzhidRtPWU/rFgeDOKoEsllzx1wNkQNeF0SwoLisBeY5KPBDk+lVnXCyvqFaNf
 fBXW6Fb0LTKPZnekl0l9+HliKoqzhQ5wYXvNHiVBuKGpVtCEUk6hgqU1Knk=
X-Google-Smtp-Source: AGHT+IGubP2iCTuCyZ6yE7PZ7fqh1WFD1EalA/6wRofWBfLKR0gPhAxQUDuoA/JPJLBw75qeR6aCjg==
X-Received: by 2002:a05:6402:1d49:b0:5f4:cb60:b1bf with SMTP id
 4fb4d7f45d1cf-5f72297d704mr2493639a12.5.1745781470559; 
 Sun, 27 Apr 2025 12:17:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f70110791bsm4547238a12.13.2025.04.27.12.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 12:17:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
Message-Id: <174578146801.16256.5835084697538702793.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:17:48 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 12/12] pinctrl: samsung: use new
 GPIO line value setter callbacks
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


On Thu, 24 Apr 2025 10:35:35 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[12/12] pinctrl: samsung: use new GPIO line value setter callbacks
        https://git.kernel.org/pinctrl/samsung/c/0a5b9be31f78898c7d6e7778377e8ab6ab0399d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
