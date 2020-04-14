Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 361FB1A882F
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 20:01:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E639FC36B0C;
	Tue, 14 Apr 2020 18:01:43 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FF7FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 18:01:40 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f52so556011otf.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 11:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bilYsvZAPOBeLR5infdzzosnMgLyQCA6aquQk0OK3DQ=;
 b=DtCYzq8GuTMo29nHsXtzS8lapyU7HJTPv7vBu7XE5OqilpLtct4SqxSC5iAW1kfDjW
 vTSm3S2Iy1tlfjmlBF7lLEcI5QstlXDNi9hk93deIHAdxFoJAvPfLVLZJxCAMyZfolXX
 mTpCnfbGP2BU9NF2eQ/PYS8Aws7TUEJhDOMbVjVs/JI2Z5ymsdlUWh7/itTk/WlLTF57
 jgUYn7H+2yIeCUCY8UOQYJuJqxpjEG7jS76nPz37CqU4ydJEKtIDeXW4zXjxYnGU60qu
 p9aL2mmLaW934u4xEk6YO/FIgWaHPFHkQPsyFrH42uM5p5F8DoOxIetlUYBfYRiVTQLb
 vipw==
X-Gm-Message-State: AGi0PuYF1lsi29rJogCw4XCRRFzAPdJ22L5h0Gtg6Ik741xM51WR3VdI
 sW3ZICK/AIjnakdBW0ULuQ==
X-Google-Smtp-Source: APiQypIyeT6xZf0FyX/A4PwaP/ZCpTja6l9L2zgL1zqqCWt/vp9DiITDaZcngdai2PZwvxJRbfN1Ag==
X-Received: by 2002:a9d:12c4:: with SMTP id g62mr814625otg.164.1586887299735; 
 Tue, 14 Apr 2020 11:01:39 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h11sm6288667ooj.17.2020.04.14.11.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:01:39 -0700 (PDT)
Received: (nullmailer pid 11421 invoked by uid 1000);
 Tue, 14 Apr 2020 18:01:37 -0000
Date: Tue, 14 Apr 2020 13:01:37 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe ROULLIER <christophe.roullier@st.com>
Message-ID: <20200414180137.GA4816@bogus>
References: <20200403140415.29641-1-christophe.roullier@st.com>
 <20200403.161414.635525483978443770.davem@davemloft.net>
 <df446a1a-c651-caa9-6086-9d84b11f3159@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df446a1a-c651-caa9-6086-9d84b11f3159@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandru.ardelean@analog.com" <alexandru.ardelean@analog.com>,
 David Miller <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 0/2] Convert stm32 dwmac to DT schema
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

On Tue, Apr 14, 2020 at 03:11:03PM +0000, Christophe ROULLIER wrote:
> Hi,
> 
> Gentle reminder

If it is in DT patchwork, you can see where you are in the queue. Feel 
free to review patches in front of you for faster response. :)

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
