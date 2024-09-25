Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 926EA985E7A
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 15:36:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2225BC78006;
	Wed, 25 Sep 2024 13:36:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9185AC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 13:36:29 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c7d66ed84bso40962a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 06:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727271389; x=1727876189;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7KN4Zv/apNegyygaOv4t6KJ/pBYjtFLH00UEJLC0jcg=;
 b=mzeimy6slwl8ctpj1Mh74kW/VUlqtm8XvEnnTYgneSCGCHToLyNEO5fEpNZHuGDvWb
 v7B9tVR/WIFuMr7AH9DwQjIMLTHjNW3CVWv2NEQOpILjRwxkisctnHzqlwSUChYr/LnE
 /35Q2Sj6riUBWtQJcjNAPrTLNrPsApxm+9EQU/m2h7ql4bl1iJDr2xJw+Lc5cr+fMSjX
 ll9Jj2/IBjrF0mHVSRsQ+hHKwVAaZnRhbzHdcTYnkPcmSDlfflS8+UjySxxUd9OjYg3Q
 qjyb6naOvM9eryBo6Rf/eboEtNzY+Peo37qmkeRXawUDeStQfBVp14KL79aJX8m3ww40
 0e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271389; x=1727876189;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KN4Zv/apNegyygaOv4t6KJ/pBYjtFLH00UEJLC0jcg=;
 b=ibTCQypI8zDUDnbZjwK32Ix2rOYwzaV9pC7IXCrpJTZXiWR/on6dl47b//obZn93zV
 8EDXsSXoVa1u+wC0GMUi2jKFr/E9vLMolZ4YjTSkoD0v3j1TVO1Yim5WTliTEqXCHbaJ
 mYGzUQSjBAN2hCVNTuSl+stRXQVhnvyxN9GSC0ILiyw8EUwd6BborjtPgiIBbqsCzPKv
 W2P653h1Tl0p2QUJEWiknIEEtwv/1T6wKL4Kz1+Pw2GwHi/4PHYnqKbLrN60UWe3yvu2
 opeuqqO43VmVYPKLdydjP5M7N0XMPc92oCj3eDvdbdQA4KzFR8HXOilCfIoVXveXY94h
 +PDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8iclzUJ3YxVxR4KyqMf5CvQSoXZcZl0KSZ3Qaetl9GmwVaAbVTe4tQEtSoC1uW/x1Jt35y+34c4K2Kg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqU78A0SPYCoRUQuq/ZJCMsbF391KxhMiB06VXCGfmjw2+Vbpf
 Arh9eX1YjgSk5cbjvFyGz4pP6klAmen6kO3Ige0fnyOaUNYHnBV9
X-Google-Smtp-Source: AGHT+IGLZfbsBMGsUvkUzwwgYsHqnh+inLH39us1h6cw9TzK12tm2k4aAYtNfaclJ6ZMDoLFrAGcyQ==
X-Received: by 2002:a05:6402:3588:b0:5c7:1ea4:1680 with SMTP id
 4fb4d7f45d1cf-5c720608dddmr942483a12.1.1727271388900; 
 Wed, 25 Sep 2024 06:36:28 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf497167sm1866456a12.34.2024.09.25.06.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:36:28 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:36:25 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925133625.4ahkfbqekfqjddhs@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjdE-005NsR-OU@rmk-PC.armlinux.org.uk>
 <E1ssjdE-005NsR-OU@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjdE-005NsR-OU@rmk-PC.armlinux.org.uk>
 <E1ssjdE-005NsR-OU@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 09/10] net: pcs: xpcs: drop
 interface argument from xpcs_create*()
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

On Mon, Sep 23, 2024 at 03:01:40PM +0100, Russell King (Oracle) wrote:
> The XPCS sub-driver no longer uses the "interface" argument to the
> xpcs_create_mdiodev() and xpcs_create_fwnode() functions. Remove
> this now unnecessary argument, updating the stmmac driver
> appropriately.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
