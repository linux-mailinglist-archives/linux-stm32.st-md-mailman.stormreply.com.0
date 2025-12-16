Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA822CC110E
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 07:11:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 989A8C87EDC;
	Tue, 16 Dec 2025 06:11:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2D80C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 06:11:26 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-34abc7da414so3010474a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765865485; x=1766470285;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6h0HpTE4JvNO401sC9YC1zjzbkEMY4YQbWy6fAX6+G0=;
 b=B4OKuiEYqSfBRQwFpcTf4ZVqv8QynNeD8DbFkYM21Z9BzX5mkxfqtYVEWuL8llG8jf
 W064Cp2seIm3jyz+Uhi59OMpraZ3wieV5nQ35cVkLAx6p2KSuXVuu0SU3K5e2pnYjzsc
 LlH/R7XdVlH3GUq4lJlZOuOpDn+Etuf85o4Es3ZLyAXxcMyKhenThxC6DjcEU0o7Fa9W
 WJtU82GXqnkiLVKaGO3k4E2fzlhXCPq2IO2PCyyX0JGpfH+jtcT39KtpJT3UnDmIaNB5
 a1VWcDplFvapoYOdPhmhIkYfkiJXE4La3YWZeu9LKX144MwI5Ix8i/sWOIg3vci2Oei9
 9gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765865485; x=1766470285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6h0HpTE4JvNO401sC9YC1zjzbkEMY4YQbWy6fAX6+G0=;
 b=stcINmfai9lE5uaww6fNx9eC8AQflVxp036QWqDj1Wdfc3cyTqWscNP7Ucik+51qv+
 KSBYZlT2gf1TOIlTe9xLgy15mm+++HZ6p7RLYt/RADnPnfiPPosdicdNztW5a57zcHzW
 a7cNS/v4nNSevsZnru2hJDAFsGuIaqRpVzsRHHPkjjUcyq0KzWn/rkkTETsEpZa4Llss
 0B8CIf5bY5vbKFGOEtdgqT7AnK7isMwghjLHkOL/zWGp82Io09IOtURJxMpxoBSrLi65
 Bw2CDXRdNX1MfDj0mPln4C2CFIvPFSiOzudCStmHaclzaQLIfBvgboWIIjkeT+2Y0zhS
 DmLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCtI6XHvY6j7Dl8/8SaVNGf3Dn8jt8Hy64+S0YDN4GHVdpHKGh2vlCVSPTqei73fOTE9SQKwm/v7058Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzej4xSix0lg7sHv0ojFj1kATD6N5GovKjRIr0TP1RNs+PMtHVu
 RJ8p/iEpb7jR/BQaR+aTWTygjpZuxg70JF8bE8aGGjmaRJd5WUcltKi0
X-Gm-Gg: AY/fxX7bW/5Uh+fZoBcjp+3npwzrBhGzKOYIWfJgsFohcB88hT2TZRArpbcsj3AEnd6
 ruNRtNjRogQkGLrbtjmtKNCmInz3P7Fc6rPikRyOGAhXRq1n5mUmpT/s4FOq7fbMvbjluW4UTcC
 hqtFo45VgW+5AneHC+22sLwykSOaITXnreo97cSXiW69/8Hsaptm2/sMQBojLdAChLeXaKNIw4D
 LV9NhY64FQWWgYona/mZ9RRmVlH10JRWGen4Zs22gPejNd4Ytz5jhnSUYuIw3fS/D2y4q9/K/cr
 7ei5u6KpYyHiYA7uUU+pmrGny1mupNgiVQOrei78fLi9ATGFPuVn2OozN7Q0oGvz5OcgClY3yrV
 8dHwmuVeHCu6ky/UI8NEQvIr+S91Ulk3Xshb6ntAAR1GJ6hz+OkcJ6GBIDEXUKkpB0YWv8B+FqQ
 F1nJlOh0/7MiU4m2kuZCAerW+Emo4qFdSD80NOX0AwMZohK3MXa8w=
X-Google-Smtp-Source: AGHT+IFJAmO+3G7br6lpUjw9es7pGYzNlpGk5tFUMnsEsBNlQ1wUjlSd5k+lWHPv3a/dqdPQEiCn/w==
X-Received: by 2002:a05:7022:ea43:b0:11b:b622:cad9 with SMTP id
 a92af1059eb24-11f34c02663mr7682270c88.21.1765865485165; 
 Mon, 15 Dec 2025 22:11:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e2b46f5sm49975086c88.5.2025.12.15.22.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:11:12 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Message-ID: <yc65vlbqkok72lnidezzrivfvz6sdserm7jazmu4uwivbqufpa@we6qlhaufwlt>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] Input: stmfts - Make comments correct
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

On Mon, Dec 15, 2025 at 03:30:02PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> No functional change.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
