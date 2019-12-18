Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAC5123B3C
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 01:01:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78FA3C36B0C;
	Wed, 18 Dec 2019 00:01:38 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3611C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 00:01:36 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b18so125661otp.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 16:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9vg2WtMo4ZpT0ZxliZmTf/NuvDxUCffHyo9DOYsxFcQ=;
 b=ZBGUZSZ/RCmwyI+I9YEnj0pGJBhDU4Bcjg/uvMYUYFAMkLyes4h1FRNMEEDs4SOpCv
 oF6mimT3GT6v3I0A0FVyo9SnP0wwGXwWzfd0P+TQAlgDuWmNVXjWwBWDDWZ3w7RgmIZj
 5lvWBWjhRIC5WlSXkntiqcPIpq/QUY1USw/dihjt/Aqv6LGuLx4HQ63FM2MzW1B7Yk5v
 rM/J+XoALeptwCeDvgY2OpE0bpUy0hLa14RuU/Mn0JDuMsJjhR3TokmjJEWii0Vw/n4z
 e24tXufVE3NiMKenxiWP6pWS0LARUvFI0ifOIIXPV7+p7Qd62FJGSMbC/nsOgV8gnAmz
 KNsA==
X-Gm-Message-State: APjAAAWCdfv+54yIMOoNg/CYETpKsyn4BIpFdFQUwK9RwhnG9nehOYNv
 +ROuXP1yG1RtgZ8m35VnSQ==
X-Google-Smtp-Source: APXvYqz4KsCKLuH3i+DvdRRLBPycXfz72EfHac3NLerdd5D5i9FdA8OPgGvOfr8jCfsIYQiq+hO6Gw==
X-Received: by 2002:a05:6830:109a:: with SMTP id
 y26mr123322oto.227.1576627295508; 
 Tue, 17 Dec 2019 16:01:35 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q7sm128986otn.9.2019.12.17.16.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:01:34 -0800 (PST)
Date: Tue, 17 Dec 2019 18:01:34 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191218000134.GA23692@bogus>
References: <20191217092201.20022-1-benjamin.gaignard@st.com>
 <20191217092201.20022-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217092201.20022-3-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: dma: Convert stm32 MDMA
 bindings to json-schema
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

On Tue, 17 Dec 2019 10:21:57 +0100, Benjamin Gaignard wrote:
> Convert the STM32 MDMA binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/dma/st,stm32-mdma.yaml     | 105 +++++++++++++++++++++
>  .../devicetree/bindings/dma/stm32-mdma.txt         |  94 ------------------
>  2 files changed, 105 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/stm32-mdma.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
