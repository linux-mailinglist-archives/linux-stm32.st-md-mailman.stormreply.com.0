Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF7415B0E9
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2020 20:23:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5871C36B0B;
	Wed, 12 Feb 2020 19:23:56 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B5FAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 19:23:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so3624286wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 11:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BxOEBk0OKDVQaQ1jykEnv7FtZWP6/XV6yKSqEx4izqY=;
 b=LC9x1oP7D6Kv4xPOS5y9ufKAAfofqmoqi2Fc2HzhKWm75lOMR/KkGAYNehp3KWwtke
 TmnfD2efFR2SBoKaRvOzON/xuA5UDae6/EIOVBH7suBLs8IA4UrBQVtu6pAr0LPfZk4Q
 B1Pca6eJHx+BiXpgG4N08+bSVW4KlFCgWuOM2ww+hn5nyyGUR2ktv8YTtp1wo7VJLXfM
 df+gmLChwHixqaHh62sSoLXjiwhpb3VvMguKTI00zlcMfojgQRk+NIo1qcoEv8MAg3su
 1aAE8KK5rkgj0gvuhSXlwtj9F+cRQB1/hzRmaaolPN2039H6cl0CdvFvaD46SRJvKQAV
 3CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BxOEBk0OKDVQaQ1jykEnv7FtZWP6/XV6yKSqEx4izqY=;
 b=H2U9GkaRVMFI2gZm+94i+jv1XkPRKxAeHcLDrgOwTTOMGkIKMUSWRMR4r3BmbteJgb
 C/akCKEJoCQE5PvTfj3Mn+G+RAkoXTGqpMRw5bdBiVI77N/oRNKCPaQfAJ28lhJEmmR5
 mcFMwz5/OXOyqURAs1gQB+NFLBHli2S/IFD4RGUbF+01mTaPt8dgmPa3R9zq+KhUR7PE
 w7NtNKXL6eSDGubNuV4SoByEK8VCalggoiamgz5TWdd+7hLUQnAmO2a/X8HeXnAqraqr
 ynywOAob5mk/Bq1LIt/e6xqhS9uTxLKiZc/VMh49ZTZ1HwHP8tdtf93yuhSsCrLGxgC9
 VoXw==
X-Gm-Message-State: APjAAAWwLKeo1YqFPDIsO/xOSsosalPDQiwAa99m5iP0/UvmuW6Gmwis
 AHExcxB2lR19gIoGSUkeLq3xfg==
X-Google-Smtp-Source: APXvYqyWqw8BKICcq5QZlIbjaSRydX9hYWd4c1GuAjl40H9iZHJ6iLJuURr569xFagrcOuf+H0w3aA==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr651484wmc.168.1581535434685; 
 Wed, 12 Feb 2020 11:23:54 -0800 (PST)
Received: from linaro.org (14.red-88-14-208.dynamicip.rima-tde.net.
 [88.14.208.14])
 by smtp.gmail.com with ESMTPSA id 16sm1940727wmi.0.2020.02.12.11.23.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Feb 2020 11:23:54 -0800 (PST)
Date: Wed, 12 Feb 2020 20:23:51 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Message-ID: <20200212192351.GC2949@linaro.org>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
 <20200128120702.26166-2-benjamin.gaignard@st.com>
 <20200212165116.GA2949@linaro.org>
 <f25fc32a-7131-6b78-5bf2-d2028e74820e@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f25fc32a-7131-6b78-5bf2-d2028e74820e@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Pascal PAILLET-LME <p.paillet@st.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: mfd: Document STM32
 low power clkevent bindings
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

Hi Benjamin,

On Wed, Feb 12, 2020 at 05:07:49PM +0000, Benjamin GAIGNARD wrote:
> On 2/12/20 5:51 PM, Daniel Lezcano wrote:
> > On Tue, Jan 28, 2020 at 01:07:01PM +0100, Benjamin Gaignard wrote:
> >> Add a subnode to STM low power timer bindings to support clkevent driver
> > clkevent is Linux specific.
> Does 'event' or 'broadcast' would sound better ?

As this describes the timer hardware block of the mfd, I would say 'timer' is
more appropriate.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
