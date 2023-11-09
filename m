Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 741657E6A5D
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Nov 2023 13:14:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08531C6B47A;
	Thu,  9 Nov 2023 12:14:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CE17C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699532042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAh9L8BgLNMrWbHh/2X3B2F2bnI/8yZ4Lx19OACfIMU=;
 b=XEYezGodwyRfTeMyP5KcbCsNoiL6vJ40n/uMGH4VFvMBvn1fTVb0WQLSj2w97/EB6ClFzy
 P/DhGwhiOtf64EnwW9SnO1eQzGvxPAO7GijFEnuAjZTuxIDuG9olfRDOep/V1k/p/h4+NB
 3BkXKImC4LiuQBDrPOoHFZT7oDQd17o=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-mGByknKMPLitcdcMzrqnCw-1; Thu, 09 Nov 2023 07:14:00 -0500
X-MC-Unique: mGByknKMPLitcdcMzrqnCw-1
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-7ba0f486647so88550241.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Nov 2023 04:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699532040; x=1700136840;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gAh9L8BgLNMrWbHh/2X3B2F2bnI/8yZ4Lx19OACfIMU=;
 b=hKzF5Kk2YIsvboFA4DW/2hw2pUyM3bbKhFYFxraM0npKduTz+Xtnbw6KXUbK6cMbls
 u9ptTLxUmskYhxgaljAWhDrG/pG7i9ZNYj41P0TnHk+k1i2F8pi3bMtppmIFsPBy0U9T
 Etgpl5vszLhD3nwAg77nWD5rHcRnh3umfWZtkVFPdjG3MHxSms8DzvNIGrVA5GziYT+3
 zjzpqKrsCJUy/3YT2jKgpNi4pJENXBLrj7cDHTenHXbS5vUi20xaRRTFSup60MBxkSY7
 qSTVdTR/Ilr4tsVXHvVTfdwVLS6WiV9Itsw4FRL4+kxqvJ11KUL+C/kB0QWgM5ZrM4YN
 EMaw==
X-Gm-Message-State: AOJu0YxXQqWncUsR1UbBsSvxlfpgtK+mrUVmhJ0+8IK+mlV9Qb9UbgG1
 7bXbNMM0B8uHdz3/USfC9FYg6tKwsPOB8vR4PYAtbFgJ7wy5c+xCcjfukjsnZYCNG0y2HlCRbOD
 P1S1de4QVq1NEa1TmsAiHczoA8ye9vvMGPwsU3UyD
X-Received: by 2002:a05:6122:1524:b0:4ab:ebf6:d33a with SMTP id
 g4-20020a056122152400b004abebf6d33amr4434038vkq.1.1699532040200; 
 Thu, 09 Nov 2023 04:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEAxY0nj/0v5nor7NxsmD9RUNljGGVM05DfuLXm6QO9KoxG2lCVGMBL0SkNm/L5qih3hGBuQ==
X-Received: by 2002:a05:6122:1524:b0:4ab:ebf6:d33a with SMTP id
 g4-20020a056122152400b004abebf6d33amr4434027vkq.1.1699532039848; 
 Thu, 09 Nov 2023 04:13:59 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 m13-20020ad4504d000000b0064f3b0d0143sm1993411qvq.142.2023.11.09.04.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 04:13:59 -0800 (PST)
Message-ID: <01aa11e0c8b0aebb1340b5702a42b20c7a7aabd9.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Gan Yi Fang
 <yi.fang.gan@intel.com>
Date: Thu, 09 Nov 2023 13:13:55 +0100
In-Reply-To: <ZUyjOEQHHnnbzwrV@shell.armlinux.org.uk>
References: <20231109050027.2545000-1-yi.fang.gan@intel.com>
 <ZUyjOEQHHnnbzwrV@shell.armlinux.org.uk>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Looi Hong Aun <hong.aun.looi@intel.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix MAC and phylink
 mismatch issue after resume with STMMAC_FLAG_USE_PHY_WOL enabled
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

On Thu, 2023-11-09 at 09:15 +0000, Russell King (Oracle) wrote:
> On Thu, Nov 09, 2023 at 01:00:27PM +0800, Gan Yi Fang wrote:
> > From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
> > 
> > The issue happened when flag STMMAC_FLAG_USE_PHY_WOL is enabled.
> > It can be reproduced with steps below:
> > 1. Advertise only one speed on the host
> > 2. Enable the WoL on the host
> > 3. Suspend the host
> > 4. Wake up the host
> > 
> > When the WoL is disabled, both the PHY and MAC will suspend and wake up
> > with everything configured well. When WoL is enabled, the PHY needs to be
> > stay awake to receive the signal from remote client but MAC will enter
> > suspend mode.
> > 
> > When the MAC resumes from suspend, phylink_resume() will call
> > phylink_start() to start the phylink instance which will trigger the
> > phylink machine to invoke the mac_link_up callback function. The
> > stmmac_mac_link_up() will configure the MAC_CTRL_REG based on the current
> > link state. Then the stmmac_hw_setup() will be called to configure the MAC.
> > 
> > This sequence might cause mismatch of the link state between MAC and
> > phylink. This patch moves the phylink_resume() after stmamc_hw_setup() to
> > ensure the MAC is initialized before phylink is being configured.
> 
> Isn't this going to cause problems?
> 
> stmamc_hw_setup() calls stmmac_init_dma_engine(), which then calls
> stmmac_reset() - and stmmac_reset() can fail if the PHY clock isn't
> running, which is why phylink_resume() gets called before this.

@Gan Yi Fang: at very least we need a solid explanation in the commit
message why this change don't cause the above problems.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
