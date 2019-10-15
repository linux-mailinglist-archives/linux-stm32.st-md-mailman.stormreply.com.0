Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E3D7D8A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 19:24:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8638C36B0B;
	Tue, 15 Oct 2019 17:24:04 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1F1EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 17:24:03 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id 60so17648146otu.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 10:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AMnuJgHGU6R0IzytORO8cFlW8ykU5YUSocCPPL5eBC4=;
 b=Dkazv8d5xR1526YbPDcOZFsD5TFNLabjEZUlIJETA2fu2UkLgvErnPajoaN3Zh8bQv
 kMkYsk0AaFlk5FBdTlAQEic9Bs7lWTRSbzwAjG1sBPMtqQL4AZAnuZsIGJaHtTp1FRc+
 EFKkxPep31lp0F+G4C+kSwxx3Gh0wvdwp5Hd6Zzsu1Bxcow4k2DpB5d4e354FW1ZyKoU
 lGfi8SeMpqG9eaRU/ge3a3dH+tZLKkgpx4HgRIXoS6ttT3pVPyPzBFp6//ElAxGZRzqh
 GAyLpxw42pmVSkEwMm2EK/e5FIZwYB+QIw7K8oU5es1JrMis/jPerSPJ98UfMnhWRie7
 fCbA==
X-Gm-Message-State: APjAAAVjhf7s2Btee9VHzUvpR0l9NRGb3R6yGy8AoUavQ3bPvjllHKOC
 IpgXJKfzahKSRYiK/pIPTg==
X-Google-Smtp-Source: APXvYqxeAQyn2woHyJsNz/1A9Qqotnbqgu/lYixgaEz9AtYG4uiKdx1AbMY3H/CJDkTrB7+S/N/KHQ==
X-Received: by 2002:a05:6830:22ce:: with SMTP id
 q14mr3987927otc.115.1571160242078; 
 Tue, 15 Oct 2019 10:24:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d194sm6658461oib.47.2019.10.15.10.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 10:24:01 -0700 (PDT)
Date: Tue, 15 Oct 2019 12:24:00 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20191015172400.GA724@bogus>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
 <20191007134410.10337-4-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007134410.10337-4-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] dt-bindings: usb: generic-ehci: Add
	"companion" entry
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

On Mon, 7 Oct 2019 15:44:10 +0200, Alexandre Torgue wrote:
> "companion" entry is present in "generic.txt" usb binding file. This commit
> adds it also in generic-ehci yaml binding.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
