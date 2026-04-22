Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 16cFIqOG72kECQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A24759E3
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0E5EC5A4C5;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F333C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2026 08:42:09 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260422084208euoutp0295a7b4ec39d1cab6336140d6e46abdd5~ooTsr0X2l0365403654euoutp02f
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2026 08:42:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260422084208euoutp0295a7b4ec39d1cab6336140d6e46abdd5~ooTsr0X2l0365403654euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1776847328;
 bh=YrPgAfVKB+qxDc2CcSoeSAb6iAceV4edZfrbKmtZrQI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ut+6VcWqnwBTF9NoOJ1778Dtgk6DwTujz0tNMOrl+XSJhLEP753HmZgb0RiD177Af
 3tHjIWF/a3W1ndJLEnZhsb+IOdv83NH3l7BlOD21/sJaqph4ovi7EeuzvSeAMa6pCv
 PWNQqT3fo2/oACq2NycAnD+2AeaJCJYUyg0M0/1k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260422084208eucas1p137123bfccf5ca996ba7f0c56ecf1c1e9~ooTsZ4yvQ0209102091eucas1p1-;
 Wed, 22 Apr 2026 08:42:08 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
 [106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260422084207eusmtip283f6f1250b08ee1a384856d03b43da69~ooTr9v0DZ1239612396eusmtip2K;
 Wed, 22 Apr 2026 08:42:07 +0000 (GMT)
Date: Wed, 22 Apr 2026 10:42:07 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
X-CMS-MailID: 20260422084208eucas1p137123bfccf5ca996ba7f0c56ecf1c1e9
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_"
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
 <20260421115008.2690541-1-j.raczynski@samsung.com>
 <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq'
 -> 'tx_underflow_irq'
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 3C8A24759E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[127];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[samsung.com:s=mail20170921];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[samsung.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.713];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,AMDC4622.eu.corp.samsungelectronics.net:mid]

------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 21, 2026 at 02:39:15PM +0200, Andrew Lunn wrote:
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > @@ -78,7 +78,7 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
> >  	STMMAC_STAT(rx_vlan),
> >  	STMMAC_STAT(rx_split_hdr_pkt_n),
> >  	/* Tx/Rx IRQ error info */
> > -	STMMAC_STAT(tx_undeflow_irq),
> > +	STMMAC_STAT(tx_underflow_irq),
> 
> Please take another look at this one and think about it.
> 
>     Andrew
> 
> ---
> pw-bot: cr
>

I don't see anything wrong with it?
- naming is correct, same as stmmac_extra_stats from common.h, as it
  wouldn't compile otherwise
- string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
  not close
- ethtool just polls data from driver and in my tests it is ok
- all instances of 'undeflow' are changed
- 'underflow' semantic is ok, 'undeflow' is just not correct

Please correct me if I am wrong, but imo no issues with this patch.

Regards
Jakub Raczynski

------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_
Content-Type: text/plain; charset="utf-8"


------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_--
