Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADBE9E7F91
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2024 11:39:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25FBEC7802B;
	Sat,  7 Dec 2024 10:39:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06650C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 10:39:25 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-725958d5ee0so2820356b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Dec 2024 02:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733567963; x=1734172763;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFscs7fH90hM8XMoELo7T9NbLyoZ3UXoG7rlMcZyHVo=;
 b=R/1fTXz10TQXUVCwvRTc1vL3/dPbgQzUHoyWtQOAkzy2m6J7xUTn/0En5oQgoLlVTe
 G3DWM0A+cImSXo4TYCJ5VM2be2NVR+v0Ymot474MqLxShOdLBW3VR+RTuyFpoUECiYpU
 psLj34EFjUbjQeMGd9oFRW8wQiHTsWgjVUqDrnCCt+mkG6o+k3rUQ2mD++4i9GTyjZr9
 fG+T7nP3V7cAuYSPjL3fnwkxDhGXC/PLsmYUkbUQmpYch0p+TwO2KjwVk1nuYlmAJDXN
 giWu+Z/HBvZ4/zvov7Luj08n4S9wL9sMOxcKA/kJWbyh3RLxgdkBGUoo0Bw4ShSg73Qm
 2Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733567963; x=1734172763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFscs7fH90hM8XMoELo7T9NbLyoZ3UXoG7rlMcZyHVo=;
 b=TpTbmiAJZFHfkGYhOMojzO0xBD92peDn3wedddBjCehxlKn2jSSOX4EUKr453oV7zJ
 F2QP3WTVGp+yXoF3Meg5ZKWRpXbp96KucnmZDwGuQJeO2RpemX7dHYBT/MANvx+hYz0x
 o6TjnqcktoppGTqvZMmQ/Sh6CoKRtqBRyCABfw1qa0a7djyC+Lf3FTpUom4a822zoV/D
 KQraQh52JitljR7mUMVs75ybn/Di5KH1eoWMw/0cPfhTV02EoariERkXuqdiIUGIXDuB
 vBlbPkRSqg0KYBCW5FH+hJefx/ioGY6wOaHN8Rc3h1IB/hyWY2DCMFZYWXV4nZz1eSG2
 65Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAQGWNzZu2gDtOA8YFH4NIauzPv2qC2EYtf7vFiPyaNdIi8Z+5shwxcMnxsJRE5RvOblMzOv2BMqLgYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQpFFXd+/yBAIgn8cLzzx2zDH6Zdotj1x6MBvuqNijABrxaF+v
 roKYyFMZvbRzyUJW/cPqCQbcUPhGvqInltB2cReIYpYtz/118et8
X-Gm-Gg: ASbGncsXJP4z3rzle2ANOFlNiSE+6cPEwieXT566vyBlppW7SGOho4FExRihS8OEnE7
 yg7c305EfA4maxsCDT73RLRtnQJS3FXfUFiz5dMl3T1JmhGcOqAVBjF+Z43DrY9sIQEsCaNTxR4
 yf3sLs3Fm5QKsYmopK26GCU99/q5xgxFBljHJ1Bkuf3RolqmWENvXEjy+S0j7Dh2+T8HyJfrCrC
 ozy8mQmkPhP4U8/F78Ih3Jz2MgW4bMoTc/Vu+7pLmYzUQg=
X-Google-Smtp-Source: AGHT+IEysiOlJ9ETZ/Xxh9z0hjLaghuXzoMd9yG4NbBjqLdyrzHc4t//d+YwIv8aZJjTQdnU3t7pmg==
X-Received: by 2002:a05:6a00:4c84:b0:725:d1d5:6d80 with SMTP id
 d2e1a72fcca58-725d1d577e8mr1656122b3a.7.1733567963483; 
 Sat, 07 Dec 2024 02:39:23 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2a1598asm4278372b3a.81.2024.12.07.02.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 02:39:23 -0800 (PST)
Date: Sat, 7 Dec 2024 18:39:00 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241207183900.00001fad@gmail.com>
In-Reply-To: <Z1QfupFfg07jTMUc@shell.armlinux.org.uk>
References: <20241207070248.4049877-1-0x1207@gmail.com>
 <Z1QfupFfg07jTMUc@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Move extern
 declarations from common.h to hwif.h
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

On Sat, 7 Dec 2024 10:13:14 +0000, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> 
> So I think rather than bulk moving these to hwif.h, where some of them
> remain out of place, maybe placing some in a more appropriate header
> would be better.
> 

Totally agree.
I am going to rework this patch into a bigger one.

pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
