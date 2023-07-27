Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A3765534
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 15:36:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 855CDC6A603;
	Thu, 27 Jul 2023 13:36:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2720C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 13:36:48 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2684e225a6cso137959a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690465007; x=1691069807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xOaiTAn8rGdkF5zlwNwyGQldTdN+p5xKE7WTqru15pI=;
 b=pMLpHBb6BmMtboe1C4sJxIkYr8dNkmU+gKItdL4KdTIAwZPMTR2WEHApDlsNV/exj1
 vy0HrrjjphyqbyWiPKGTuaxEYwpOglO2en25CdqUE9j5dhZ2a59goHyfmFznLDJueic8
 Ftx/ZuOfCZHWqLSYtBEVxldkYBeqd0YopDBzFV/paNo8mbOFGRNRgi9/5tupwMfANpMu
 Df5wCQmmFutdRrUMGt0Ju9G8B7vYQyrMyTlUYpmo1Vx4/K6QxFP5PUyUNLbfG4gtky2Y
 diAvLRVMBLWfPAkZ1CxES0UoHywH5CDidcKxVnCputXmfMZgTGXQesEw+D8ECKrNFyrc
 ZtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690465007; x=1691069807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOaiTAn8rGdkF5zlwNwyGQldTdN+p5xKE7WTqru15pI=;
 b=g9QemtHa4aIhO8CfcWvsyBmFeYGizRhzYkPRZ6vOmnp4854L/9oxJ+Gvyf3i+fF1hX
 RUgjwqaXC4tx/EDsoga6M041TyRbdE+PbGS/S1VN+kyb+b55j5kOFtO6EF9nMS/eWO5d
 b1EzegULUQtHoTvSzIsESXwz8uC7W10v7mj31eUT2+rfbXkYKHsYpFR+p4mb3YFyl3qd
 sEwrajdOjVkLGbHLjY+tptYL8Y8StyvXtz23yuGWjhhRw0US2tqYLlXkrYd+uUZRjjEC
 iIHgOqC6zA95KveDdhPKXRqPe2EbEy6M5L+lfXLVDJLVM0ygdVv2X0MtH8/1/w6ipo4+
 v0Vg==
X-Gm-Message-State: ABy/qLYUfqnaXFqtsOiouJHIgsDkVn1IQTMVEGxS3niY2RxToEKHc6gA
 wFrKtRZr/lXvG3bL7ZHGXIg=
X-Google-Smtp-Source: APBJJlHCafwH9S3OPhpqA+8W7Lczg5j327l0RTvLcvMbx0d1mOFIr6oHUvQ+C0fUqmdUivM04gTd/g==
X-Received: by 2002:a17:90a:1189:b0:263:f36e:d610 with SMTP id
 e9-20020a17090a118900b00263f36ed610mr4812722pja.0.1690465007141; 
 Thu, 27 Jul 2023 06:36:47 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 fy16-20020a17090b021000b00267f9bf21ebsm2899810pjb.0.2023.07.27.06.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:36:46 -0700 (PDT)
Date: Thu, 27 Jul 2023 06:36:43 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZMJy6yt4CL250x6Q@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <ZMGIuKVP7BEotbrn@hoboy.vegasvil.org>
 <729dd79e-83aa-0237-1edd-1662a6ae28cd@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <729dd79e-83aa-0237-1edd-1662a6ae28cd@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

On Thu, Jul 27, 2023 at 09:20:10AM +0200, Johannes Zink wrote:
> Hi Richard,
> 
> On 7/26/23 22:57, Richard Cochran wrote:
> > On Mon, Jul 24, 2023 at 12:01:31PM +0200, Johannes Zink wrote:
> > 
> > Earlier versions of the IP core return zero from these...
> > 
> > > +#define	PTP_TS_INGR_LAT	0x68	/* MAC internal Ingress Latency */
> > > +#define	PTP_TS_EGR_LAT	0x6c	/* MAC internal Egress Latency */
> > 
> 
> good catch. Gonna send a v3 with a check to and set the values for dwmac v5 only.

AFAICT there is no feature bit that indicates the presence or absence
of these two registers.

Are you sure that *all* v5 IP cores have these?

I am not sure.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
