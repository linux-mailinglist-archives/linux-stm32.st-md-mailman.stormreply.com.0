Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 766098FD99D
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2024 00:09:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DEC0C712A2;
	Wed,  5 Jun 2024 22:09:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A808BC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 22:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717625370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PthjLG2Xlr9BKeZELuB+lxDAHRx/UOooTB7JJsTLDz8=;
 b=iv1LWY/u9wDRQmb03UAaFBlHMfzzpPBX7ov7SwxyRP/GXpLKx6tHbn2XaB1fC5IJoyx0cL
 IMB5in91vbfer+nJ7l/KIDVRCNZ6IBaBy0oB2Eln830NE+awMwf2xs3UvLV/qEAvoRPsLG
 QelshWd0Rty/6FCOWbaOQ6aGL6XNuDg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-uMb9ET0ZOCO8Py5EaAgzkQ-1; Wed, 05 Jun 2024 18:09:29 -0400
X-MC-Unique: uMb9ET0ZOCO8Py5EaAgzkQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ae259a01ffso3351186d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jun 2024 15:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717625368; x=1718230168;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PthjLG2Xlr9BKeZELuB+lxDAHRx/UOooTB7JJsTLDz8=;
 b=lEJO2S5enuU/gfR6jIViGP8drBK3vJVGy3oed4fq7zAtNjmrL864vVdM5iGgPt28uZ
 H3u1EVx34nTRzUULyIMn0vnipCl/bL6Ictgv78mY4yuTfo/b18ZkqRUQepTdGebolKuJ
 QHCzepQpFcUsUsCkr2buvEE4Nz6BdBEC22HALMnCw7Qm7iJnXUDGxt75u9RF+2/Ha5Dz
 4hiEAHZwhm7TSYi0o9Ue0va2GLOGEYkkHJbfinYN29BfgaEvu9Guo7oCxff4vc8z5I3e
 5qZDMHhA8WONOINYvRd1r76Je8slaqzpCh2Jl5z+YEsQGqF9dWcY/+RqS5uNOrzq7zCD
 1TpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi1v4fRqoBXIUy3BbEoI8X8P9okIkA1hq7wRWB143qfuIzIhHGc+Ofw5sSFV4npbk8i3ed5thtw9316bkKRUvCno8Kryet02Rk6Cwk/eI/nnGasXvhnuMb
X-Gm-Message-State: AOJu0YwcpvPRY/M8HjsfT4lfr7g0nqBxAQovCrAbm469JeySRJeXfRap
 XHKk0vhW5IujKG/BbLBhZBJv8viJ3t/zJe9wIGg5z4XO/yG1qG3Qqm83E6a4CbJlIl8ScVEAyuq
 nEWeHsfNYTF9nBDSvEzvBvQZsJW6EIlW1/5bW8GCjXbmeVq9lbYvKetHIw20jxekSaBET+k0GmO
 gDIE+tinRhAA==
X-Received: by 2002:a05:620a:4111:b0:795:2ce1:2ab with SMTP id
 af79cd13be357-7952ce10408mr241540285a.23.1717625368076; 
 Wed, 05 Jun 2024 15:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF323Ze2tcCLdbDhMPSdXlprBkPVOtA2a9VCBJft88WBFLAMY240eDJANqsJ9gPJclY48ps6g==
X-Received: by 2002:a05:620a:4111:b0:795:2ce1:2ab with SMTP id
 af79cd13be357-7952ce10408mr241537085a.23.1717625367617; 
 Wed, 05 Jun 2024 15:09:27 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794f305f502sm477303185a.96.2024.06.05.15.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 15:09:27 -0700 (PDT)
Date: Wed, 5 Jun 2024 17:09:24 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <64mscxnkyilqq6osqr27ed2axemh7tid5urek5udj4t5u5z6rb@ip2rv3wuxkwt>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0PF-00EzCJ-UL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sD0PF-00EzCJ-UL@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 7/8] net: stmmac: remove
 obsolete pcs methods and associated code
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

On Fri, May 31, 2024 at 12:26:45PM GMT, Russell King (Oracle) wrote:
> The pcs_ctrl_ane() and pcs_get_adv_lp(0 methods are no longer required

nit: pcs_get_adv_lp() -- if nothing else I'll prove my worth in
terminating parenthesis in this series :P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
