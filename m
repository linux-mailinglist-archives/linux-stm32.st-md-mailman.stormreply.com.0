Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C770985C79
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 14:48:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 021C8C78006;
	Wed, 25 Sep 2024 12:48:14 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA96C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 12:48:13 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5c24648e280so994806a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727268493; x=1727873293;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DuXdQsw+RRom/AQjZTFSHz4b4b5PpEAcJKit79ndl6w=;
 b=FkmYNy1RsPclHX7vfCJjd58Biit/I3KgDIufIIl38m17J/uag15yIwl7HuP2Z41n6d
 rsrpG4DUDd33/+mmREBnzd/AA5Cx7zfTMJoJgi0CQN0srNnHjUWbtSF7um2KPsrDCQyH
 zqkatjkIoKrOnvZA8uC0SvIB6sGlhZl7b4KZxr7/ygNszsKh9Lx3/hE8bhY6QCfwMTui
 PK5dHEp65RPCTYskgSA677UhvfBBRdzF1h0x1lDfIipY7bkXe8mYz8MMtz5uZdcNh9oM
 DB7/x2H2ezHbA2WgnDZaLgmhuN0L9Gf09rWcwA6acLCa0Cz2vrtu+jGSCPrrvJqxpO1y
 pR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727268493; x=1727873293;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuXdQsw+RRom/AQjZTFSHz4b4b5PpEAcJKit79ndl6w=;
 b=JddXv+HMdPFG2CnRHr4XpHX3ZSQkVmouLTCalOD5H3VRlOZnPKGoTJyfyJ6xlggDZ4
 qt4pjTO3tnSv0CQggaj5LFmTB049wHcWpnf6535EssRkOGycxgJ0BxRdh8xGvYk2ikYP
 IesnRyFNva+6VV/I6ki5l3K+NRQi6uci6tSNjpkyrmEGWw9PkvXMiQ76dKGjuzbFSNzB
 1kY7SkgN37StqhWUgFX/Ka9he4vvw9fn5BahwsDuzeIAVfE1EOeUYOkgeIWIB+AZFIzy
 flblmQK2ilS7BbrPglA9V5tZ/PIQvmsZkCK4F7dVCdjGAdHmtGgOUxy/atBcVAqpU374
 wtSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH2gTF9vxfDkBZBj0YVIinpbAYZ5+vcqMyB6HHwXCARRaIHECEo4Gh/W7dn/8/wz8jgPc2JNPPe1fXQQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGiRK5hZpiLbqOXQC45Q9XXpRwYNm73eALaaqMjAXppmmJRK8b
 V3841CrpsQBc6VAmgCycnx0tXI4Xzs9n2YJPRUh7+SRdl0dP4KSw
X-Google-Smtp-Source: AGHT+IEtS9Hfz450TsCH221Y56N8bpHwpAsKkJiKLbNa39+hGodyMA6e5M8gCGSjwSsuRdNKFiopvg==
X-Received: by 2002:a17:907:9485:b0:a8b:6ee7:ba1a with SMTP id
 a640c23a62f3a-a93a05d63e7mr129465866b.9.1727268492748; 
 Wed, 25 Sep 2024 05:48:12 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393133c51sm204779566b.189.2024.09.25.05.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 05:48:12 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:48:09 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925124809.rw7wsmcpmjn7sqxj@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjck-005Nrr-2B@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjck-005Nrr-2B@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 03/10] net: pcs: xpcs: get
 rid of xpcs_init_iface()
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

On Mon, Sep 23, 2024 at 03:01:10PM +0100, Russell King (Oracle) wrote:
> xpcs_init_iface() no longer does anything with the interface mode, and
> now merely does configuration related to the PMA ID. Move this back
> into xpcs_create() as it doesn't warrant being a separate function
> anymore.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
