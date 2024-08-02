Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A39462D7
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 20:08:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CDA7C7129D;
	Fri,  2 Aug 2024 18:08:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF17FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722622127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLcM9MWhiHw0bs3x9mpTiGnVhWovcyriDIOcsgAYyLw=;
 b=eEm4ZIHsmHB8KAbxxQl05DzR3RhxfLLVQQ9X4oYdae88UulzP1/sqNFScbxv0+OOzsUyDv
 +U+QnVzFH/LACLklpl9qKFVTztv421/xgRtSoPpi2NJAeoun5sPKeCa1e2AyHgueBMbACV
 JuYeTJXCxmyJfnkxM176BTEJ6dA1Eqw=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-0tlCnCUNMkSglr_yy2K76w-1; Fri, 02 Aug 2024 14:08:44 -0400
X-MC-Unique: 0tlCnCUNMkSglr_yy2K76w-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-2611d47e7daso6657520fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 11:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722622124; x=1723226924;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLcM9MWhiHw0bs3x9mpTiGnVhWovcyriDIOcsgAYyLw=;
 b=nPaJ26/8LutC/+ixM9PP79ng/gMw5DlF9mUFh+gZpy/kdihjT4vTeKmo2HrEWJZYtT
 tcJ2xjFGjdvDX+kyUpC/kQzls1q0Qnh4hAx+kAJrpSUwyegcGxgmZD7WPd7118ZglAr/
 /LmzOB9KwGLkIHZ5BEvKEpAveLDMV0nYhUs/pniJPHeAzy78dS08UKGQFGCarBStH7wr
 s5NwQEqJf5LATv3Gr2lfGWddPpkkUCD2B8URf1wD9Q7WFXQ6qmyS2ghV72HY0oLTIRb/
 OkZglr6PC67PqLQFe6gyJIBR8pYeq7W4q2hymn+yPXO/1Lj+Cf9fvRr9wMXfVuLA2DwL
 PcNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjlvxJOoFCH7qSFeNI59oCE0oxXqrpcMMaaLC1D49ZQWrBkYERVBc30+31yoTeR2ayOdKXXX1lFdxli0UBRepj2lE7ETAUTwc3O6R7iyWmERcCNzn4o3i/
X-Gm-Message-State: AOJu0YzALV6A3Q6kYkbS/RaKCv6sOIRAgCHe7PD+rM1bYv2L4wEbxZu0
 BnS3z1T6J82pjYWVynoAVaOCBWahmuHS76eSIhEk935gsKq8twd/PnMrLAJIzv6cORnrwQXeEiK
 cdo7gSdLMIQF8q521fNjN0aYWvq+0fKVAb0cxcR3vZcJlHHqMGVRFKnhGdZ3yxmLlQCHJXRWA84
 norw==
X-Received: by 2002:a05:6870:b528:b0:25e:14f0:62c2 with SMTP id
 586e51a60fabf-26891ae014cmr5007841fac.3.1722622123953; 
 Fri, 02 Aug 2024 11:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8xANvIW9PT25/s/1o20v300D34AcEqg5SxNPaonYq0aR8vsoes+Ti9UOB+gaVvGdCgqf3A==
X-Received: by 2002:a05:6870:b528:b0:25e:14f0:62c2 with SMTP id
 586e51a60fabf-26891ae014cmr5007818fac.3.1722622123595; 
 Fri, 02 Aug 2024 11:08:43 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4518a6aaa56sm9123001cf.16.2024.08.02.11.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 11:08:43 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:08:40 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <kse4bj55hlnwsmidecriuqvkxj6i2fh6eredcd37jia7u7djbs@gcpastryv7jp>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpo1-000eH2-6W@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpo1-000eH2-6W@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 03/14] net: stmmac: remove
 pcs_get_adv_lp() support
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

On Fri, Aug 02, 2024 at 11:46:41AM GMT, Russell King (Oracle) wrote:
> Discussing with Serge Semin, it appears that the GMAC_ANE_ADV and
> GMAC_ANE_LPA registers are only available for TBI and RTBI PHY
> interfaces. In commit 482b3c3ba757 ("net: stmmac: Drop TBI/RTBI PCS
> flags") support for these was dropped, and thus it no longer makes
> sense to access these registers.
> 
> Remove the *_get_adv_lp() functions from the stmmac driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Clean up seems good, I'll take Serge's word on the IP details here.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
