Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89414F309
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 21:06:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D2ECC36B0C;
	Fri, 31 Jan 2020 20:06:47 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B166CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 20:06:44 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a15so7793463otf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 12:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AbO+gon8QEJiqD6b6PW0TmWlbcPnG39Yyju/1Ptva7A=;
 b=Lsum4vOteaN9Uipak1WAn/r34tpPvnA/nzx+1XusEBuMoD0vl1lPplw1bQuIjyxtBV
 HnaNs9rUNVUUZmxToU8P1CFpDFemIDi3mBVhCp/h/tfuAFxqNAGEHJ4xXr38OMg7Wo5D
 rJPCS4rtY9b13ZpTfyhwe5hdNP2DIh8B1YtXZsigMPZzcdr7D16JnaKQbpX4ZSwVuRvj
 jhuNpfEU0bN0UGkoOdKKEVQOaLNw9SsN9dXi2UDPBrSZMB3XwRsUPWF9dIsM5r41nYXx
 oAFdEcxFOdbti/y9TU/XS4Sp/8XkQ7fFzF9A5SQyIZ4YopvSvXJBPgmJs+jIy4MprhzT
 9N5g==
X-Gm-Message-State: APjAAAUaNH21/iWHlTOWZfSDMi7aCPcvIme0H+EZyXbAmrMs1ifDcD5B
 ilQxYs/bRVx7OhBWa28vTw==
X-Google-Smtp-Source: APXvYqypW7CmmlNjveScb/uhps8dAYhHTYKvur2n/FPc2Yr0pzCb4xGJ80xks8YoGnMim8R/3fHxsg==
X-Received: by 2002:a9d:1706:: with SMTP id i6mr9325576ota.151.1580501203331; 
 Fri, 31 Jan 2020 12:06:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w201sm2978724oif.29.2020.01.31.12.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 12:06:42 -0800 (PST)
Received: (nullmailer pid 26745 invoked by uid 1000);
 Fri, 31 Jan 2020 20:06:41 -0000
Date: Fri, 31 Jan 2020 14:06:41 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <20200131200641.GA24534@bogus>
References: <20200124084131.23749-1-amelie.delaunay@st.com>
 <20200124084131.23749-2-amelie.delaunay@st.com>
 <87imkr7nou.fsf@kernel.org>
 <c29867bd-8056-a82f-2273-101470395e78@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c29867bd-8056-a82f-2273-101470395e78@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: usb: dwc2: add
 support for STM32MP15 SoCs USB OTG HS and FS
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

On Fri, Jan 31, 2020 at 05:13:25PM +0100, Amelie DELAUNAY wrote:
> Hi,
> 
> On 1/31/20 2:36 PM, Felipe Balbi wrote:
> > Hi,
> > 
> > Amelie Delaunay <amelie.delaunay@st.com> writes:
> > 
> > > Add the specific compatible string for the DWC2 IP found in the STM32MP15
> > > SoCs.
> > > STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
> > > ID pin state. usb33d-supply described the regulator supplying Vbus and ID
> > > sensing comparators.
> > > 
> > > Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> > 
> > This doesn't apply. dwc2 bindings is still in .txt format. I have taken
> > patch 2, though.
> > 
> 
> Thanks for taking driver patch.
> 
> Rob, would you mind to take patch 1 (Yaml binding update) in your tree ?

Done.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
