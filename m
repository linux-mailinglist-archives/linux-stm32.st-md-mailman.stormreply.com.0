Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNPgCF+c4GnokAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 10:22:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B240B789
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 10:22:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55BFFC3F944;
	Thu, 16 Apr 2026 08:22:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B00B3C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776327772; x=1807863772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FF2Hu3tsfPgmUysXQRYTdoXImMRnS5VAm2iqlazCptQ=;
 b=EuZ5VAMT1cq4ufhFAgAudH3+FR0ni6JJSrXN8tFXzl4YNpL1D3xjsDvY
 dZGNNyur1dhXsGeHB6QX8NF197l5BFbUMmQYWkEgBVoogudvr1VKMhQX2
 Dk4sh/8VBi+xVTL0Rns/L7l0R0Ap9msv+urUSwAEu4eh1zVNrOlIP6tea
 tP64hM7CfnWOCPTQyjeqKXPw8+IaVnnNhjLlu3BTX//jiolmg7vnQeQ3i
 dMm6Y4Poga40ztfM4HwQrWa7e/nIOI781g3sJ7/s+MpjgqnrykRSVBpIa
 /vrI1IPdJ5IIB2VAKROy5EzupKfS8OBPMkdJv3/3Ax/6Q6bP9UAOtBN6G Q==;
X-CSE-ConnectionGUID: r4YhM6cNTpSF0ADOInyY9A==
X-CSE-MsgGUID: +QNJOLZSSVqgIdHk8b8HXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87622375"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87622375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:22:49 -0700
X-CSE-ConnectionGUID: ahImSsagQhGSPzyuUq/DjQ==
X-CSE-MsgGUID: 0Khl595iR0GlOcxcYe+M1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230598180"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 01:22:49 -0700
Received: from [10.107.24.239] (soc-5CG20645H5.clients.intel.com
 [10.107.24.239])
 by linux.intel.com (Postfix) with ESMTP id 29CC120B5713;
 Thu, 16 Apr 2026 01:22:44 -0700 (PDT)
Message-ID: <bacbe354-c202-4690-8e06-91f0244567ed@linux.intel.com>
Date: Thu, 16 Apr 2026 16:22:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paolo Abeni <pabeni@redhat.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 ovidiu.panait.rb@renesas.com, vladimir.oltean@nxp.com
References: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
 <72d1b0b7-c8df-463e-a2d9-bf5ff04ba33c@redhat.com>
Content-Language: en-US
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
In-Reply-To: <72d1b0b7-c8df-463e-a2d9-bf5ff04ba33c@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 hong.aun.looi@intel.com, yoong.siang.song@intel.com, khai.wen.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net,
 v2 1/1] net: stmmac: Update default_an_inband before passing value
 to phylink_config
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:ovidiu.panait.rb@renesas.com,m:vladimir.oltean@nxp.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hong.aun.looi@intel.com,m:yoong.siang.song@intel.com,m:khai.wen.tan@intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[khai.wen.tan@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[redhat.com,lunn.ch,davemloft.net,google.com,kernel.org,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,renesas.com,nxp.com];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:server fail];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[khai.wen.tan@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_SPAM(0.00)[0.181];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,intel.com:email,stormreply.com:url,stormreply.com:email,linux.intel.com:mid]
X-Rspamd-Queue-Id: A84B240B789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/2026 4:12 PM, Paolo Abeni wrote:

> On 4/13/26 4:03 AM, KhaiWenTan wrote:
>> get_interfaces() will update both the plat->phy_interfaces and
>> mdio_bus_data->default_an_inband based on reading a SERDES register. As
>> get_interfaces() will be called after default_an_inband had already been
>> read, dwmac-intel regressed as a result with incorrect default_an_inband
>> value in phylink_config.
>>
>> Therefore, we moved the priv->plat->get_interfaces() to be executed first
>> before assigning mdio_bus_data->default_an_inband to
>> config->default_an_inband to ensure default_an_inband is in correct value.
>>
>> Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
>> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
> Since Jakub sent the net-next PR and forwarded the trees, this patch
> does not apply anymore. Please rebase and repost. You can retain
> Russell's reviewed-by tag.
>
> Thanks,
>
> Paolo

Thank you Paolo, will be rebasing the patch and update a v3.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
