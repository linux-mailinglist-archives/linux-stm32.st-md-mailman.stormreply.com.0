Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A9123B1F
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 00:49:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65395C36B0C;
	Tue, 17 Dec 2019 23:49:04 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F4D9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 23:49:02 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id p8so49251oth.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 15:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jlg2ki2yobPLE5+Iz6CrZ9HDHot4jm6bFyP7eLrU3qQ=;
 b=nEWQl8ijIsZAz4kqkh0KelRGzYgcBs3+dWCKFaxWIcEpqXWd8ac/YRqH1x5fcqt4Fs
 txHZJNd0lx9Qj9QRf9YzQHJjTE2HEz0Fvj9wEMV1S/KZevfjwvDb48tTvcQvkL6qjx+w
 KMlszmlZwRp/iNdYf6NVmjs3Z8Ctoy90Uex7Gfs+FpJHUB99gHrDmlkSUWK2pONcTV/U
 1kwedWkYUP0e45fFJVT2iV6UnP2ZGUkV4xbkUqHrjneJLNNKLS4UmVpDJA3jPpnWjnxP
 0ezi/soPoB/htqi/yWZCQMku/6mP3OuIhyxRRAequxggIA7KXB0igRaeOk7Pw+1yLEez
 HhXw==
X-Gm-Message-State: APjAAAWz4fzSfe+77sgV2LACbWt43yAEXG8TAcSEmgDIDNspEi3gXNg+
 7j1P3VyLZHmGcI33I22XxA==
X-Google-Smtp-Source: APXvYqw+ktR6zmWC15DCzXWZThyq8OS0sep09XrYuNDJkj8QrlsDYGIEMrNnc9m27AMPyfWoF5gKSw==
X-Received: by 2002:a05:6830:22e2:: with SMTP id
 t2mr81055otc.129.1576626541083; 
 Tue, 17 Dec 2019 15:49:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g8sm116989otq.19.2019.12.17.15.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 15:49:00 -0800 (PST)
Date: Tue, 17 Dec 2019 17:49:00 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20191217234900.GA429@bogus>
References: <20191217082415.14844-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217082415.14844-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: stm32: convert mlahb to
	json-schema
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

On Tue, 17 Dec 2019 09:24:15 +0100, Arnaud Pouliquen wrote:
> Convert the ML-AHB bus bindings to DT schema format using json-schema
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
> V2: Add "ranges" property as mandatory
> ---
>  .../devicetree/bindings/arm/stm32/mlahb.txt   | 37 ----------
>  .../bindings/arm/stm32/st,mlahb.yaml          | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
