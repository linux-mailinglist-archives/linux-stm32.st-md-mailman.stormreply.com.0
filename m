Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7C84B65A
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 14:29:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B75C6B476;
	Tue,  6 Feb 2024 13:29:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1F85C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 13:29:27 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so773033866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 05:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707226167; x=1707830967;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T3K8mbqYkN2pkZybDOCl4vjMSCHUwiGmdLNrVAvodoY=;
 b=Ob04frUEgyWUrMMnEZYo/jt/uH0ntHijvk68UyLXgd+I+CktKlRkptcq63om7Oh9k5
 taVtZwPbFwNhsloMZQucgaC3Nm0F9zStcLf+0/7djmG14/3dipqGgnimpOlX2mvC9ihs
 hNoGU4fFhmbph1rtOOR9i61eS3kNaNQI1TbLvn2uw0w4rP2L8CYn2oRsnIo9A2hCs3o3
 R6QJj6tBkSERlvehXvEo7SlX/0hGKTIFG1IMBxqKd9C0hKxkXLvBnandwb3TjE93j+xM
 iwpy6lby9OBM1zcdGmkyc1hRSUrNBGtXLRqzICbrCtLxAWRyWb+5cAWpGkqxC/1hEPBv
 BQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226167; x=1707830967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3K8mbqYkN2pkZybDOCl4vjMSCHUwiGmdLNrVAvodoY=;
 b=pm3Hb/vkDjZPkVwclGU/FwefeIjFDnY2iaqr5pk6WuCCUXubUcKXu0GJRWgQF4qeIf
 MJHaIP+8wtQXdQZy2ETWcofHnZfalUXI99TBFdm3/iHQLNTlje6C37NbFhqpblrEdhe8
 zhc8bDjyvRrv/Tm0o9h0NEagPztz8l/e5n/HTh8eD6q+0xyppM0FnzU4A0xM5GXULlhZ
 5PFk/cDOtWPyshLFpUhE5sicvk1q5qx3KAai1mHGQ1H939+YfYQADnVZjpYAl7U6G9g+
 DmWx6JFUG59mCPuQCNE+X8kV6OXzpINtbI/j9V2sq9mFlDbooXVNg75Cx9s8sLdfKlIA
 p5cg==
X-Gm-Message-State: AOJu0YyHChTqircjsFpMgQbybn3lRpX1veMix8GkPxSGCRZJO7qDKLhu
 ZZ4Jrrrbzrd0v668AbruIe+bj6+J+VzQf50Spj1/M9n9prXShBJ8
X-Google-Smtp-Source: AGHT+IGTLVlI+eqWQ1ZQHpgJ55q3BV6R5mXCQxRL1l7fryYx1ZyrC2J6wB/lmr+IJkT8F+ppYUfZzA==
X-Received: by 2002:a17:907:7f17:b0:a37:7fb9:ea27 with SMTP id
 qf23-20020a1709077f1700b00a377fb9ea27mr2353193ejc.48.1707226166913; 
 Tue, 06 Feb 2024 05:29:26 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXk8hbCICCWddyCzOnK4U/3MlJvCaV6Wpr8b1jGhhgqCOBdc8qhnubiPfFoS0MAPd/0dffFuFzHlR9IAyVo398lMI/r6ANV7fOIjpmQyicICoI6lbsqnHDAdu6wzUV4zswDsBD1Za/4BBdWU4s6nnP1ldHTrMw/gzlp+VIC9Fdj4AvAn6kWbRhr8lwv+QYH8qyDUdGhwHeKd1TjOEXRY0Yjaly+wKTINW1KyHG8D3XnSj6ztr1HvyDI3AdBhkt7kR3hcXuOtZsF7uriIqp3AYgU8TBlbMPMYjwQpGUj2F226OMakQwNyLODHhsFqCXKsDCYAhEm91M0VbxioWFRyH3UPGZrkcjov+nH85+ySQjCsFsULQBXJYjc2gK0Ph0VjuxbUrgAUG5NkLhcmV+O77qsehH4hWbk3ygPoU7POkNjuApBE1RRK+ManeeTi56VNVD0pnbMlg6XINvE4H2GEv5EUNjceNNiY6yJmPtPbB1PBZV9UFMYK0cGHqFLJMCk2D4LofN3JIjl2c5TgrzyVaNywp1/1aiK1+ZbpTBect2MRkezoWJOrzt0frBaBHAMnuXVJ2dUbXVPS0vuD4BOwS4hO77KB9rH69OjjO/2t8I0BgI39komLmZQ1EjULK9kow0dFApOOv6+27h6iT7EXGbdwKbRfWqvIDDSXFtnhIIdRgvQSzsf77IUz/BmUv/xrgjEtuDG
Received: from skbuf ([188.25.173.195]) by smtp.gmail.com with ESMTPSA id
 cb6-20020a170906a44600b00a35a11fd795sm1137050ejb.129.2024.02.06.05.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:29:26 -0800 (PST)
Date: Tue, 6 Feb 2024 15:29:23 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20240206132923.eypnqvqwe3cga5tp@skbuf>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
 <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
 <20240206112024.3jxtcru3dupeirnj@skbuf>
 <ZcIwQcn3qlk0UjS4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcIwQcn3qlk0UjS4@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] net: dsa: b53: remove
 eee_enabled/eee_active in b53_get_mac_eee()
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

On Tue, Feb 06, 2024 at 01:12:33PM +0000, Russell King (Oracle) wrote:
> > I know next to nothing about EEE and especially the implementation on
> > Broadcom switches. But is the information brought by B53_EEE_LPI_INDICATE
> > completely redundant? Is it actually in the system's best interest to
> > ignore it?
> 
> That's a review comment that should have been made when the original
> change to phylib was done, because it's already ignored in kernels
> today since the commit changing phylib that I've referenced in this
> series - since e->eee_enabled and e->eee_active will be overwritten by
> phylib.

That's fair, but commit d1420bb99515 ("net: phy: improve generic EEE
ethtool functions") is dated November 2018, and my involvement with the
kernel started in March 2019. So it would have been a bit difficult for
me to make this observation back then.

> If we need B53_EEE_LPI_INDICATE to do something, then we need to have
> a discussion about it, and decide how that fits in with the EEE
> interface, and how to work around phylib's implementation.

Hopefully Florian or Doug can quickly clarify whether this is the case
or not.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
