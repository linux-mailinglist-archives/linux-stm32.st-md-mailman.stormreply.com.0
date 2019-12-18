Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F734123B39
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 01:01:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AFF1C36B0C;
	Wed, 18 Dec 2019 00:01:29 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9524C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 00:01:26 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id a15so121827otf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 16:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8DxfJPe+fLp7sS5LGmoHqh2JVFDd9HUExmcrr2ei05U=;
 b=DX/dT+6hlgdMyBGirw0IiuNkzXL8dh9r5Blg+VrCY+t32CQw6iqou8TcqyQRy4bkRR
 x79Wsw9ykhww3rXBWO+oi9Skn6ZxWN1MyUIwBFIgWYr+1FUcgREW6pYsJwGlKHSq0BJq
 G7rspBOnjSosj3vgGVTKd8e5iABt6nDwRCt+3wqQWeIou0iq3D7glUeDOglo5c1FOoOd
 OrvRLcA0ru3vLuSunHTa1PrAqDxddrOoa0DLWIXWIPgJG4YfsBr77clZWH8Epsww4ss9
 Oqg/3X0qbdL+WmkEafhysN8Crzvmy9pig2P4P7vvwWjrlTIAgJ59Y9fqt4d/2CVnYZeO
 Z6EA==
X-Gm-Message-State: APjAAAWFcwnJ9g7RBjV+TEhvZOSAuzXdl7z6AxKbRBqFkUON2lOBZeLY
 AW3qQxZZkYCnWs95tKgLyg==
X-Google-Smtp-Source: APXvYqw+qBUt2vWsfODrii4GKSLi4xoYT8NdjBgJ2LVmEiUcC9EsU5LCVPA5a9FubOjJkoUUwOOnnQ==
X-Received: by 2002:a05:6830:16c6:: with SMTP id
 l6mr182117otr.186.1576627285170; 
 Tue, 17 Dec 2019 16:01:25 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 97sm126795otx.29.2019.12.17.16.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:01:24 -0800 (PST)
Date: Tue, 17 Dec 2019 18:01:23 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191218000123.GA23208@bogus>
References: <20191217092201.20022-1-benjamin.gaignard@st.com>
 <20191217092201.20022-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217092201.20022-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: dma: Convert stm32 DMA
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

On Tue, 17 Dec 2019 10:21:56 +0100, Benjamin Gaignard wrote:
> Convert the STM32 DMA binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/dma/st,stm32-dma.yaml      | 102 +++++++++++++++++++++
>  .../devicetree/bindings/dma/stm32-dma.txt          |  83 -----------------
>  2 files changed, 102 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/stm32-dma.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
