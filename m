Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E725AFCD87
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 19:28:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B088DC36B0B;
	Thu, 14 Nov 2019 18:28:13 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 345D2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 18:28:12 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f10so5731307oto.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 10:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c57kRuz/wdX2ojYongufIJZjkHTf4M0B8KckeBCmq7w=;
 b=m50yduKaxziqp+fALXlEFg36cGzCDOTeloMvjzPVy4s+LwzJ7Xx1F6WkD6BkyCBDGJ
 Fn2cRoehvwmzHuqBrqtrx8X1/P0Drb0Zibiix2DgiR7HpGWqnTuN2fyuSE5NIZwldDU7
 WvSDvKe4/dLh22gGl5XEuKJUWagsaeXSCvVkT+RHXmhCbqgj87zZz/9ZoSQGOTcokKUj
 mXNL7L6LItNyLAz+R+MmSkgRzHIzPCbnNRkGnARZziy0DeSJUomsFQVUVRJJt7boRVCA
 LqzaVeROHufEwuv+D22CAd+bjnGZ88IYpFrow8GTqX5zyQdLVVmdpV79rgRLgdnPIunE
 fvYw==
X-Gm-Message-State: APjAAAVod6LYaZp3vmrJ0L2LvDKTdyZjhWoWDCYl+HcQ6JkyV2fVpsNy
 oZxXqCdq4QMyhZ4Rra+LlJdEwuk=
X-Google-Smtp-Source: APXvYqydePYwxykYh+8rFhhUMjHqM+gGBXZEGQ9HgBhBBB8gZBssUBQF6b95aeyrt6SvCfQneJ6Vng==
X-Received: by 2002:a05:6830:11cf:: with SMTP id
 v15mr8083572otq.36.1573756089672; 
 Thu, 14 Nov 2019 10:28:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l20sm1948314oii.26.2019.11.14.10.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 10:28:09 -0800 (PST)
Date: Thu, 14 Nov 2019 12:28:08 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191114182808.GA29513@bogus>
References: <20191108125244.23001-1-benjamin.gaignard@st.com>
 <20191108125244.23001-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108125244.23001-2-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh+dt@kernel.org, linux-crypto@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: crypto: Convert stm32 CRYP
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

On Fri, 8 Nov 2019 13:52:43 +0100, Benjamin Gaignard wrote:
> Convert the STM32 CRYP binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/crypto/st,stm32-cryp.txt   | 19 --------
>  .../devicetree/bindings/crypto/st,stm32-cryp.yaml  | 51 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-cryp.txt
>  create mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
