Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD57C8597
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 14:22:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A7A2C6B442;
	Fri, 13 Oct 2023 12:22:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F671C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 12:22:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-405361bb9f7so21491005e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697199732; x=1697804532;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yyHFcssb/VuHTaRYJQiKUZDakpNW7s6ZQnEzNiBDC/o=;
 b=osk4RaVIcXFkp3DFBH/6Lf73HmGYS+mGNtH+ycrbo73VxVVGwuDRM5Ic7Kk4pLqf+T
 Vgybdrc657gTdOXcw1uSFefGjvqOrSI7xKk1KbSYJVRolguhV3qpOqKeTgKQdJ2EoIV8
 4qD07e/IbdiZF2K9QSx26JizJder8ofUCV3bBZ7xvfOMEDXdMV9kRGLoX2YKvcTEU7it
 2B4166NFyTmNCLuZ7OPiVosvHg4iWnhUjv4Eg/crcS0FesiNPDEPj7fTxsXcFr0NXUvj
 fQGy7Q9JsxVgYpV22BfjQ/K7rusEcBiRztTDkpck82BqEaXOAD1e7Nq8AoJ+O1on17Xr
 5fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697199732; x=1697804532;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyHFcssb/VuHTaRYJQiKUZDakpNW7s6ZQnEzNiBDC/o=;
 b=RchRzAoISBPqOFd38XiKGxaflDd9kZxs5zBAg8jPZYa9v9PcO9DA2n4WSeddNuo9E4
 JvEu7gUabOLOWAuQcezBngcivgOAHaxizPCHXAeDC3ZGxQdJPut+wiTwyYmeLW4YxsuB
 a7hVauU33lfRiec/qSh86TYyEwLAjEjh4u7FdGrUYtXwKAad4oJbZcF74OHF7mwh2Rc+
 IIVftdBdRIR28rIGBQf2ouxTA3uihJ0poYqV7+LTtH9oaE49ujdFKSNDIoqtaJmx5xrk
 +pzkiyc11OrrqpOjm4sw+ugDXI25kH9YjUVHWH2NBosnXble2dEuL3a//Hyb2UuUszQ7
 Rilg==
X-Gm-Message-State: AOJu0YySJNSuHikNkBg0FeFsKi8moSXT7P65CrTLc8Ouv497dxIOtddY
 IRhLoyRx0cb8+OC2C+xc8JUsfg==
X-Google-Smtp-Source: AGHT+IGpbalHHfW+Fd8M+WaWQzY1M1h0TfQplqg15+qAJ7WW2wQOmeBYfXMwQwIJ4F4UGYZIsrJFqQ==
X-Received: by 2002:a05:600c:22cf:b0:401:4542:5edd with SMTP id
 15-20020a05600c22cf00b0040145425eddmr23431521wmg.34.1697199731842; 
 Fri, 13 Oct 2023 05:22:11 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b0040775501256sm995502wmq.16.2023.10.13.05.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 05:22:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20231009172923.2457844-12-robh@kernel.org>
References: <20231009172923.2457844-12-robh@kernel.org>
Message-Id: <169719973088.174758.14111137268313332597.b4-ty@linaro.org>
Date: Fri, 13 Oct 2023 13:22:10 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] nvmem: Use device_get_match_data()
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


On Mon, 09 Oct 2023 12:29:07 -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> 

Applied, thanks!

[1/1] nvmem: Use device_get_match_data()
      commit: 24bd074c417b7c538fe5297201855447a6162547

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
