Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DD985C72
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 14:47:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E46B7C78006;
	Wed, 25 Sep 2024 12:47:46 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97A05C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 12:47:39 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a8a7dddd2c3so71203666b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727268459; x=1727873259;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+LBbRfeJAH476Zzo/DwglJa17IfHtD4nGJ1Jvwz340c=;
 b=gCIx0ok4DJE5gqFA/oEdTHQspb8sEBE5bMkbma3YdWiwf5WfHQkU2U2P5cnsAmRGzH
 T7WfDpyBGdMeJLKtFfpvHWtBaanTUqUy0w+R7QY7xb/tUuUdLAOXZQzbbbG8k1O2YPtY
 bt6MC3pi2JW7up+NIzofTZpHD9JrNj6WQcAJp+kOyJGPI02/LGPvxsnDfG9AjZurOfyl
 245Twn+8V/cEa4jiUR5D4BlZyx6+gReF15lTQ3j1luD4W+x/fR7Q04S2yQRyIZsw7jvV
 WW0ZjiWBGrG78z5iKdMrjdYe6/qGo377nKwdabiSJDFaNRrerlsjAXzxCtY8Zimpd8uB
 /RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727268459; x=1727873259;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+LBbRfeJAH476Zzo/DwglJa17IfHtD4nGJ1Jvwz340c=;
 b=vbiORFFGEWz1DWNv5F6eevC/Alpk5C9c1WfgZXEpwBS32aRE+f3cinv237WzAj1m4t
 t6s+YzAa0JZi9bS0ANfBwaZedWomjFvILKq6DrsxmXoHm37+ETni4GyQc2s6S3OwNt2V
 ppGYMGUDIr4dgglNH6p5xY5T+MjRIsqv5C1ySV526VAdAeK+fS3p2zW3IZ4lPBFcT8oe
 LdSm03q94SuIqUuDME7Nwr2rrguuN+MieCpHzojNfidqQiD7is7eTPRgObJSyWbJcoGa
 0x0NBRZwkqIdhoSXsCR9FEExC8huycOunAEDbmu8JFThjgxlqy2cAGbdBbXe0jaKin19
 dDEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOHfSkzCeZTfM0Dbmr3mOjRjZ2/SQtWONnSo3AHKv0+dvWVhTT9WHSnK4XiYlLaw5mpY0uJD2DgLBmKA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSYsbh042dT3g/pzqNC7PWZSCNsCmg70yBg4GxINrD8y7w8zhW
 H1ibcImABhuzYcheNL1bWS5Abyo2ryEeD7kWr/pNz0D0faXd/LO9
X-Google-Smtp-Source: AGHT+IHxuXkv4oPA1flcUn4EbmUBgsnBEfqQgzMJGZtYhKE/Cn7w4pP0ReLZxF6SU0fNuoXpjV/0Ew==
X-Received: by 2002:a17:907:3f96:b0:a80:a294:f8a with SMTP id
 a640c23a62f3a-a93a035c2c6mr112023866b.1.1727268458883; 
 Wed, 25 Sep 2024 05:47:38 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f50b26sm206042966b.61.2024.09.25.05.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 05:47:38 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:47:35 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925124735.65xud5f5eo66mle5@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjce-005Nrl-UX@rmk-PC.armlinux.org.uk>
 <E1ssjce-005Nrl-UX@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjce-005Nrl-UX@rmk-PC.armlinux.org.uk>
 <E1ssjce-005Nrl-UX@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 02/10] net: pcs: xpcs: drop
 interface argument from internal functions
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

On Mon, Sep 23, 2024 at 03:01:04PM +0100, Russell King (Oracle) wrote:
> Now that we no longer use the "interface" argument when creating the
> XPCS sub-driver, remove it from xpcs_create() and xpcs_init_iface().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
