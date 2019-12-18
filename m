Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6701256B9
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 23:30:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CF45C36B0C;
	Wed, 18 Dec 2019 22:30:38 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A0B8C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 22:30:37 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id c77so1612620oib.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 14:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=henTx4kMwKnslxCfjb7Jc5XD6OiwjKcuIcYzzOgVmwA=;
 b=QL/9NGcE/CCH19ITYjKgDhSHG4FAY1xuTSoYCf7SPtny/S5fnd75i4oahB4AAwh/F9
 8N5Gc+YIpTe2anx9MjbmvlMvxsA++tnGP1jCpSCNyzcgoJPcN30mV8NHQALaoncTyztD
 eb5wgjt6GKDcq9ELFiq7ewpSwXPubUOjoUX7zk+Glwn3b8KjPQoPa6YGVXVHuaxtXa87
 q4cwHNYxBnJH0Ajl2qCvpLOTC2eMmxgr2VENnPRS7VT6EhrOOoS4rHthe2BYyYitARKF
 SkW0opMBPMY7vPkYBd2kgSOOky0w9iwHcnaOFyk21j15ak4XJHpNeRfmwC8rsS0HedOC
 MvVA==
X-Gm-Message-State: APjAAAVn5kia2IR8agqgJKw9ndNOI/9kLcp/QqTRL/PScFNHhdfl20ag
 R2JLZkYzOscR3tORWWdqUg==
X-Google-Smtp-Source: APXvYqxlZwKyGVa1CGInnldPg2b0i+rjBq9zRrTXBBvNP2kjFzBkxQnXqGG30D+T5zzlRjhreEKJ1g==
X-Received: by 2002:aca:72cd:: with SMTP id p196mr1498724oic.99.1576708235818; 
 Wed, 18 Dec 2019 14:30:35 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q5sm1290507oia.21.2019.12.18.14.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:30:34 -0800 (PST)
Date: Wed, 18 Dec 2019 16:30:32 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20191218223032.GA8641@bogus>
References: <20191206100058.26767-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206100058.26767-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: iio: adc: convert sd
 modulator to json-schema
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

On Fri, 6 Dec 2019 11:00:58 +0100, Olivier Moysan wrote:
> Convert the sigma delta modulator bindings
> to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes since v1:
> - add additionalProperties
> - remove unit-address in example
> ---
>  .../iio/adc/sigma-delta-modulator.txt         | 13 -------
>  .../iio/adc/sigma-delta-modulator.yaml        | 37 +++++++++++++++++++
>  2 files changed, 37 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
