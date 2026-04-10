Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NFFBs6x2Gk8hAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 10:16:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B85193D3DDE
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 10:16:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61660C08D19;
	Fri, 10 Apr 2026 08:16:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B637C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775808972; x=1807344972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FlkvDopMbw59+z0XdHrMqtDa5KxFChBVJQJSz0U20X0=;
 b=dEtVV1F52nODlzYfJVXNBbm/mpM2IykLWDtSpnmlBJ62ePCXBkmjpfjP
 uA1lwh0d2+nv3gOC4cR/A2jdv9h3UXAMWO0X+zTOc2ysjoFVPCN+7hCun
 4M40oI6nb/TgPX6QfZpvR+U1ZVcquO9q2orUrHf4JlCUggWRyWOsM4ISl
 vnkOfHbt2gP7Bvd5ONNa3KKjLsK8+j0aNJKEFru/nmXBfHf4gdPjQ/3a7
 4fnsV/gQBxm4WZwCwu9rkF0LXASiQq44yiJENH0FpeSBUce3Mb+FFhmMy
 4Rj+tHFK6LvgOSJueJiAiP/NhWI59t1hrJMM9E+jfTlFvyUnRn8/6H4hb g==;
X-CSE-ConnectionGUID: zAlNbuGtRguZ6tzGV+c/xQ==
X-CSE-MsgGUID: RdIMbONTQVeyp5CfmdE24w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76715079"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76715079"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:16:10 -0700
X-CSE-ConnectionGUID: GIvxrKJuT6K0PufgwPoptQ==
X-CSE-MsgGUID: lxTmbZwsRLa7jymHZyxuzQ==
X-ExtLoop1: 1
Received: from unknown (HELO localhost.png.intel.com) ([10.107.255.31])
 by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 01:16:06 -0700
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
To: linux@armlinux.org.uk
Date: Fri, 10 Apr 2026 15:53:41 +0800
Message-ID: <20260410075341.5806-1-khai.wen.tan@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adirrTJujEsrsK4F@shell.armlinux.org.uk>
References: <adirrTJujEsrsK4F@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: pabeni@redhat.com, yoong.siang.song@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 vladimir.oltean@nxp.com, andrew+netdev@lunn.ch, edumazet@google.com,
 hong.aun.looi@intel.com, khai.wen.tan@linux.intel.com,
 mcoquelin.stm32@gmail.com, khai.wen.tan@intel.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Update
	default_an_inband before passing value to phylink_config
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,intel.com,vger.kernel.org,st-md-mailman.stormreply.com,nxp.com,lunn.ch,google.com,linux.intel.com,gmail.com,kernel.org,davemloft.net,lists.infradead.org,renesas.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[khai.wen.tan@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:pabeni@redhat.com,m:yoong.siang.song@intel.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:hong.aun.looi@intel.com,m:khai.wen.tan@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:khai.wen.tan@intel.com,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khai.wen.tan@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.693];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,linux.intel.com:mid]
X-Rspamd-Queue-Id: B85193D3DDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell,

Thanks for the review. I will address the comments in v2.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
