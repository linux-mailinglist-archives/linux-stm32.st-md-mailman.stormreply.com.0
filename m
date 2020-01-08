Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF4134070
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 12:27:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21B23C36B0B;
	Wed,  8 Jan 2020 11:27:00 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C3EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 11:26:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 195so1459070pfw.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 03:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OyEwIf+brcpdIFP5riG0lncLBlwH96PTMEeMCIA2zzA=;
 b=D3NAVIM7clRMhS/BZxyoNCJNM+BYQBpegIc9wBhDjGqfApLd5n9Nv/ynfk6/6oM3oJ
 YgdPdNOTXxUEXbDSdCDABMCmDjaYibstmrINYgVo5rPaRHcMRn9vQSucVDKF6EfxpNo3
 Bc1qfwBOPV8u73bTwcHGS4Itg1v6X1sZQ6Q4uvoTsmgkS/KbgTdW9V7CVVHNsOg2JluG
 +WSFFi3KEyYrZUM7hYq8jpjWXk6rtQj8ajFKPtkCeBcMkxsdgUuT3wGAgrAGT2OelZG5
 8T5uqPSa9jdnX225AzmhovdA4fABGD8WZmBAocWpRaDUBJEOSIJ8hLQ0VJsXgNuMa/E7
 CUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OyEwIf+brcpdIFP5riG0lncLBlwH96PTMEeMCIA2zzA=;
 b=EYhM1zk+gPANSjq+MKO20BntKT/GuaEM6l07a0YgsWGUd8OHkb6NmuYj9130yYFP/g
 mkYuDsZXgR0HUdvNpnvxz1SzJtDZQr8LH8px7MTUyhZt//1EjNzLmSf670IkTASICSt9
 NrPhzEdsP5ogmXBCYiK9idp/bsRlfIlaG9VEniOJa+bfZ6Lqp3c8il+VVzhwg7Ldep9P
 VTIqQBz+0IQDqq7Xyo3SYjLAe/mBWc8+TDuLZ91DEtXzv1K7VUrA27V0QR75SvNquR5x
 XkSS401tTtO6xLV2pRapks/ImlLUdM21K3xow8OjYWq0ptkqy/np8Z72VE724m0irLWj
 oWjw==
X-Gm-Message-State: APjAAAUsrm5QlMLWeBA+BC1l/jrnLOtX0Ufd/zUC4tbjamvonDtdPv16
 cxKYV+LGHm2AWCiYYox+nGc=
X-Google-Smtp-Source: APXvYqxLYaAC/+wgObu27QstOjgjV05SmQu9JZgFn+fS5p/fUwMT2k3N03riIS+dfV4lMRDQ1G3iug==
X-Received: by 2002:a63:4723:: with SMTP id u35mr4546002pga.194.1578482816504; 
 Wed, 08 Jan 2020 03:26:56 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id w20sm3297806pfi.86.2020.01.08.03.26.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 03:26:55 -0800 (PST)
Date: Wed, 8 Jan 2020 19:26:52 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200108112652.GA5316@nuc8i5>
References: <20200108072550.28613-1-zhengdejin5@gmail.com>
 <BN8PR12MB326627D0E1F17AE7515B78E4D33E0@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB326627D0E1F17AE7515B78E4D33E0@BN8PR12MB3266.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "weifeng.voon@intel.com" <weifeng.voon@intel.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "treding@nvidia.com" <treding@nvidia.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: remove useless code
	of phy_mask
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

On Wed, Jan 08, 2020 at 07:57:14AM +0000, Jose Abreu wrote:
> From: Dejin Zheng <zhengdejin5@gmail.com>
> Date: Jan/08/2020, 07:25:48 (UTC+00:00)
> 
> > Changes since v1:
> > 	1, add a new commit for remove the useless member phy_mask.
> 
> No, this is not useless. It's an API for developers that need only 
> certain PHYs to be detected. Please do not remove this.
>
Hi Jose:

Okay, If you think it is a feature that needs to be retained, I will
abandon it. since I am a newbie, after that, Do I need to update the
other commit in this patchset for patch v3? Thanks!

BR,
dejin

> ---
> Thanks,
> Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
