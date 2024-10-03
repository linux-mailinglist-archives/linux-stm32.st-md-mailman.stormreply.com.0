Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C657398FAAC
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 01:39:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62642C78024;
	Thu,  3 Oct 2024 23:39:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AD8DC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2024 23:39:24 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42e82f7f36aso13396775e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2024 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727998764; x=1728603564;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VXarCceFCTUatiBtIDJC98Arnae4jY2pLkbB45iBfPI=;
 b=GrBKuPlYNcQSm6ou5J+yMv+SFV/+0MDs6pojiTLcCJhPQoxMLY0Z8G4fxUUrOpN6qc
 s5NO9x19+ycJNAhwwx+VG4jr6wV9mE0mcEhmNjEPuT7qwaGC06w4baUWuVPxwyB0/ZQG
 6b6EqoxFud0dwvZK1uBG7Htl6rQmm7qZeBLwkhXcWJbChkJS7f9UuZOrEPo1sj2Y/KTk
 urZLCVgEuRLjMdRVdMyLEVrFcbLmYkyjOrUKbU4ArsyFBVAF3HZmUN6f2iezqNFtwcHT
 nNrmuX1EelYQhfMYnIGkNkyZ391alyq6IRi6SYsJPxl1j9DpeakNh7RhWcXSmytpOGZ1
 CqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727998764; x=1728603564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXarCceFCTUatiBtIDJC98Arnae4jY2pLkbB45iBfPI=;
 b=PZBv56o5VmnRwDtAaUMJmTflyU7va7rmdgum0/9/uV8PGwRHc5EkIdhMR2AEGGejzR
 Asuw/dAt/QKCoa6qQUeXpwkbKzcxM9lwHnwV0WN3N/xXvNiQQQ3sYaRzy+Cpp8HeKuJ5
 NtOQZEzWyJWpeyP6zRq5Pr33TU1oYXaqwPN0LSePoIWSGeFgKQrWVgjHFU0+GujHNXXv
 gwDMRjFRQxw+Z2SzUyHLkBHpz/BX/HC+I4cDwUH37JIsZLLIC5Ryh92LyhkIxE/DOsYP
 MOlNk8xUDDwIIkZb5hAT33cRaw5zdMZueUN39Fi2bhimpg8TzY/ftxGbrwGpGRhfb0jU
 11Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/QBdoEKvif93A1uwnqi4OCsXmKQfKeP9dauX9OQ0C3bT05iDF7gpNMDG0FIMeMPx6okNGvkms0TxC/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhR23FUeZTphyo7/u+Pb3m8x6gUDDvXN1kViM8mCQYbwcYIWF0
 D32j91fIUq+gD2qeADDZv/0TxCiplJVAQB8fNvxMp8RFLUsVWrfu
X-Google-Smtp-Source: AGHT+IHog/Fp7a60sdaRCV3cSF39t9PYQrfZY21r78vA2oppUu9fGCT3obyxlMYmGdrOhQZk7Vt6Pw==
X-Received: by 2002:a05:600c:b8d:b0:42f:7639:d88d with SMTP id
 5b1f17b1804b1-42f85af56f9mr2968605e9.35.1727998763493; 
 Thu, 03 Oct 2024 16:39:23 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86a20589sm1272655e9.20.2024.10.03.16.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 16:39:22 -0700 (PDT)
Date: Fri, 4 Oct 2024 02:39:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ln7fzih6nobyqhzi46juwxg24btm3usgkjsrljaxn5jeywxxjo@tlu46r6nhprs>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
 <E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk>
 <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
 <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
 <68bc05c2-6904-4d33-866f-c828dde43dff@lunn.ch>
 <pm7v7x2ttdkjygakcjjbjae764ezagf4jujn26xnk7driykbu3@hfh4lwpfuowk>
 <84c6ed98-a11a-42bf-96c0-9b1e52055d3f@lunn.ch>
 <zghybnunit6o3wq3kpb237onag2lycilwg5abl5elxxkke4myq@c72lnzkozeun>
 <acdc1443-15ca-4a35-aee0-ddf760136efa@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acdc1443-15ca-4a35-aee0-ddf760136efa@lunn.ch>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: pcs: xpcs: move PCS
 reset to .pcs_pre_config()
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

On Thu, Oct 03, 2024 at 02:04:36AM GMT, Andrew Lunn wrote:
> > Anyway the Russell' patch set in general looks good to me. I have no
> > more comments other than regarding the soft-reset change I described in
> > my previous message.
> 
> Sorry, i've not been keeping track. Have you sent reviewed-by: and
> Tested-by: for them?

I have reviewed the series twice on the RFC and v1 stages. But I
haven't sent the Rb-tag for the series, just the standard phrase
above. I was and still am going to test it out today, when I get to
reach my hardware treasury (alas, I couldn't do that earlier this week
due to my time-table).

Regarding the tags, sorry for not explicitly submitting them. I was
going to send them after testing the series out. Seeing the patch set
has already been merged in it won't much of importance to do that now
though, but I'll send at least Tb-tag anyway after the testing.

-Serge(y)

> 
> 	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
