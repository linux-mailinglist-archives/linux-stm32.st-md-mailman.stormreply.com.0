Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA86A3F1E5
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 11:24:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EAA5C7A838;
	Fri, 21 Feb 2025 10:24:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB0C4C7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 10:24:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22113560c57so37391965ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 02:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740133465; x=1740738265;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ew/m0Tesk9Nn8WJobtK7q6jqPTmqqXgIVl6zfztn/w=;
 b=aZXpFpkRguaaVsAq2SRJ2ltxvMJQiBOxheNUSbgU7bBYhXp5LpRlTUMR3JP+gqDuVX
 smuiWmnYeUT/npfT748e1caS1Di+i9vUrwFM9Q6GQ9GC4eEBIwDye4MI7UaDzQ/v7rnl
 trSpeEWB7g05jeDtwvN92zl1E53VvNeXOesVZ+uVPTBGKTd2MHzfVhss9f2kstQzMEfS
 YzZyotKerWSkqwdzNcuXJe+9PgMAESMWSNdkwUlPZakW4yuDibqKYHZgNQLFUSlNXTyH
 AvbQSwhxtxzPBrEjcGjH/DBJsZwkI0hFc3v62dV/HkYQiPstRCifzXzbEaaX3tbiPgOs
 NwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740133465; x=1740738265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ew/m0Tesk9Nn8WJobtK7q6jqPTmqqXgIVl6zfztn/w=;
 b=MdJEx6RBTQU/fs4zqIbDWC5oym1zBOykDK0gqZzdHGDZA8xYQH1ODKdiBf6iS01/mX
 zricXg+zN7M/35U3kelNAWsnjMH9rzdgDRUIG9zp1zs7kGq45rtrifxG5i2RDsIPHauP
 J1mk/pnw5+lbb71fEYm5F7rBRfH7lXYsBGSWAvl2IvrUs3ceEqalchamEhgx9Od0hTjQ
 8uYcupz96uBCrizzO5t3r76xA/FuM4yjJ5mMn1z/kBwLhFGkcRdLoO1KTjWWsn84QD2L
 n7SN3BoqODAjJJ7Syisk9EemVV5ORBXI737njvJ2/9DwHOCcqhlkXbX6f9+4X5JbsXQG
 HRsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9v2BSZHLsjarCrHjiIDsBFLPtLBoWT/WCdNDkCHnEkiYZVy/u25IkvK0UL654G9naNyoHZE0zOh/qIQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMrEMAlaBRw+46u/D/x/ob0Iqs4um3WSA1vBt3pNs/3QN0aSwe
 YY5FX8cizJEXTKUIn5vRKdzBVOmQl18PZ63CyTsTDTkYsm4yTqe7
X-Gm-Gg: ASbGncswdm06Sp0+asQF6zbfLhPJZnDI/pBYQhm/DjpHdlNC2WnNCOCjyz5Gpa92CRg
 eRESUJcrPKKtoYV4gAP+oGFQXzaRfFaiz4tv7vbO/hwZ25sKWDgdMmtYEwcndA4/aZ5w842ByvY
 zzVLisKlzAF9Cgm6bjFneb4Rc4KXiaMD06EzQqgReNfwQCXVCzWnXUv0o5SVMcyF4aDTeB2fTAF
 yNELUNGJdgrTmQsHvYUzBAYo89/HMGK1eXSkOKCL7VPZ7NdMrh8i5f5SQqsihLQoYmqGVxDBa4i
 sXiGa4RF32zMgS6WlCv29ls=
X-Google-Smtp-Source: AGHT+IGJZmPsP1AQp35fmvwVzaW4gHUPKNfzSI/RTvC+piEPapIcYtvOiFrJzWkqFVimOfGDgcDxpA==
X-Received: by 2002:a05:6a21:7888:b0:1ee:e669:ef88 with SMTP id
 adf61e73a8af0-1eef52da075mr4126395637.16.1740133465235; 
 Fri, 21 Feb 2025 02:24:25 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73250dd701bsm13961074b3a.131.2025.02.21.02.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 02:24:24 -0800 (PST)
Date: Fri, 21 Feb 2025 18:24:09 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <20250221182409.00006fd1@gmail.com>
In-Reply-To: <20250221095651.npjpkoy2y6nehusy@skbuf>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250221174249.000000cc@gmail.com>
 <20250221095651.npjpkoy2y6nehusy@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v5 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

On Fri, 21 Feb 2025 11:56:51 +0200, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> On Fri, Feb 21, 2025 at 05:42:49PM +0800, Furong Xu wrote:
> > > +void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
> > > +{
> > > +	unsigned long flags;
> > > +
> > > +	ethtool_mmsv_stop(mmsv);
> > > +
> > > +	spin_lock_irqsave(&mmsv->lock, flags);
> > > +
> > > +	if (up && mmsv->pmac_enabled) {
> > > +		/* VERIFY process requires pMAC enabled when NIC comes up */
> > > +		ethtool_mmsv_configure_pmac(mmsv, true);
> > > +
> > > +		/* New link => maybe new partner => new verification process */
> > > +		ethtool_mmsv_apply(mmsv);
> > > +	} else {
> > > +		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;  
> > 
> > Tested this patch on my side, everything works well, but the verify-status
> > is a little weird:
> > 
> > # kernel booted, check initial states:
> > ethtool --include-statistics --json --show-mm eth1
> > [ {
> >         "ifname": "eth1",
> >         "pmac-enabled": false,
> >         "tx-enabled": false,
> >         "tx-active": false,
> >         "tx-min-frag-size": 60,
> >         "rx-min-frag-size": 60,
> >         "verify-enabled": false,
> >         "verify-time": 128,
> >         "max-verify-time": 128,
> >         "verify-status": "INITIAL",
> >         "statistics": {
> >             "MACMergeFrameAssErrorCount": 0,
> >             "MACMergeFrameSmdErrorCount": 0,
> >             "MACMergeFrameAssOkCount": 0,
> >             "MACMergeFragCountRx": 0,
> >             "MACMergeFragCountTx": 0,
> >             "MACMergeHoldCount": 0
> >         }
> >     } ]
> > 
> > # Enable pMAC by: ethtool --set-mm eth1 pmac-enabled on
> > ethtool --include-statistics --json --show-mm eth1
> > [ {
> >         "ifname": "eth1",
> >         "pmac-enabled": true,
> >         "tx-enabled": false,
> >         "tx-active": false,
> >         "tx-min-frag-size": 60,
> >         "rx-min-frag-size": 60,
> >         "verify-enabled": false,
> >         "verify-time": 128,
> >         "max-verify-time": 128,
> >         "verify-status": "DISABLED",
> >         "statistics": {
> >             "MACMergeFrameAssErrorCount": 0,
> >             "MACMergeFrameSmdErrorCount": 0,
> >             "MACMergeFrameAssOkCount": 0,
> >             "MACMergeFragCountRx": 0,
> >             "MACMergeFragCountTx": 0,
> >             "MACMergeHoldCount": 0
> >         }
> >     } ]
> > 
> > # Disable pMAC by: ethtool --set-mm eth1 pmac-enabled off
> > ethtool --include-statistics --json --show-mm eth1
> > [ {
> >         "ifname": "eth1",
> >         "pmac-enabled": true,
> >         "tx-enabled": false,
> >         "tx-active": false,
> >         "tx-min-frag-size": 60,
> >         "rx-min-frag-size": 60,
> >         "verify-enabled": false,
> >         "verify-time": 128,
> >         "max-verify-time": 128,
> >         "verify-status": "DISABLED",
> >         "statistics": {
> >             "MACMergeFrameAssErrorCount": 0,
> >             "MACMergeFrameSmdErrorCount": 0,
> >             "MACMergeFrameAssOkCount": 0,
> >             "MACMergeFragCountRx": 0,
> >             "MACMergeFragCountTx": 0,
> >             "MACMergeHoldCount": 0
> >         }
> >     } ]
> > 
> > verify-status always normal on other cases.  
> 
> Thanks for testing and for reporting this inconsistency.
> 
> > @Vladimir, maybe we shouldn't update mmsv->status in ethtool_mmsv_link_state_handle()?
> > Or, update mmsv->status like below:
> > mmsv->status = mmsv->pmac_enabled ?
> > 		ETHTOOL_MM_VERIFY_STATUS_INITIAL :
> > 		ETHTOOL_MM_VERIFY_STATUS_DISABLED;  
> 
> You mean mmsv->status = mmsv->verify_enabled ? ETHTOOL_MM_VERIFY_STATUS_INITIAL :
>                         ~~~~~~~~~~~~~~~~~~~~   ETHTOOL_MM_VERIFY_STATUS_DISABLED?

Your fix is better when link is up/down, so I vote verify_enabled.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
