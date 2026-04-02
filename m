Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P78ESafzmlZpAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 18:53:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98538C376
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 18:53:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AFE4C87ECE;
	Thu,  2 Apr 2026 16:53:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63991C55590
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Apr 2026 16:53:56 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43d02a71526so717013f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Apr 2026 09:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775148836; cv=none;
 d=google.com; s=arc-20240605;
 b=SUw/UL2jqn6uSG+OGPa+rbfHizAJfFNQQ2CcIqxtoAaoq3T3TK2fsIk3tWleDnpXbb
 6LnyHs/8gB2ASoxSRW5DtEiVsWbpqYq5kovpfcUVbZ2cndCwBIok12LCSx9+ac+QypMp
 CvGn9QHzIrog3OH1e8207JyoLUpbZpE9kNxzTTPsvdtkeRvSLNfawFPzeRGHSy0Ejzc3
 tLbNtxh+EDJ1X0mGP19srY27vbGNhDjlAf5shYW9eYo6cI6E3V9Rmt9sg3CUCTKBwAZA
 Thexke4Si5pHLTmoGQvK/AtXSzk/VibYKfiYmf6cNwkUDisWGPjPUGN4igKkYKqomi4s
 PtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YQHOj/bnPK/nIDomsOi7P10E15gaCTUx4OYWYgBgufo=;
 fh=pdf5qS4/pwsB2ZXVqhIQXu8fdYVn2xROVaXrPSOaS40=;
 b=hax2J6WhVsHDjr7xXM9Hcws/Bas8f+n0/VJYmMNbN1X6KVA4igRlIqU8pjn/VolhSc
 5+OSUB6oYtZMabXokKHeGOntzCyzw6ZjyDirGhCPNFYcuZ4P+t24n2/7ovuAPCI1Hx0+
 eEO0GubNx7KyA/xahgqOJI8XLOnirnupCM5eX1TzDnPQRJRJSOAdhcqgtD5X7VWkAJXY
 y1MBaLASL9H01fN3Z8QqfckCaPYccxt6OF2YFZXNfjdPNgABz3iHvXNNUGbSooh2Ewti
 taC0R/DsRO8Vya7VyO9zRSrd/rTYafhrLZNy98cZLnShT8l7sZ6l8JjtCoI1TTfrBdzZ
 G+8A==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775148836; x=1775753636;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQHOj/bnPK/nIDomsOi7P10E15gaCTUx4OYWYgBgufo=;
 b=PdLX0M6tqQ8vDxMBT3OZSgRJJL6849LxA6FxLZ/zDi0u2mOWy/3hLs+VNJ/rP9fqlS
 Pt7aR5aFOQ9OrFgcaRNuxw0PkSnkdcR3d2Pbv2y8do7Qp2s/mTXuGIy/0m/jYICcwdsO
 /JmNwcpAEKnU1IIWng3Q9COERnuaPmdsU1LC+FktQ5NKO8jPgVznrBDIClZeAZ0ymzdC
 3h9ZmY13NRNqvFkhnTWdujlI1vTsp12v5pSIHJmEgFOJqXUc65DQq6pSkjlHt4PVwPmU
 5eRdza68+YU67Kybd7LQKG5+c1uebDXn5bSd/a/015cK+aHDlaEAF4DH5UOlPbTORRn+
 h8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775148836; x=1775753636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YQHOj/bnPK/nIDomsOi7P10E15gaCTUx4OYWYgBgufo=;
 b=anNrxR7fK+wO3M9fsGTXPDrazRtJyNxw3fhpnjHECsbrXpPTimd9VG1FPpNH5XTGWV
 q6hQqB26Vq2dGbQmligL1z+lGpmzlDDlmQ7vGqyWglA8DL2oXzh/gLriK7WxtkBTY3cS
 M/Aq1h3ndt+v/65pA0WBJnfLKVQ+9RTwYQMhNLBaHoIeMpLtjF5eg+9xpaMuKCXkjw3V
 MMLwXGwTxlv0xbrpvPqEd8+aWXAKi8kWPXtakF3y5wIhjaLFCwQnRU0kyOFZbB/7NWbd
 FkOakWDkBrLVI7ZhheozlLhw/WJtBl846a847rVF714rcICuYSaIp0WOomVYHUXd6Ep+
 rkwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4it405yDuIo6CpscRcgxwgrQG50qzmArYz93viR8fcomDdI4/Q/rSRiHwXnEWPQrA4fnFNc9vuQrR1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqSbsKp2jTiPEtTTOBGrrcXliMWXK0snaNKfk4ahXO/f5D8otM
 V1pyzvynFDbr1GSrDP3we62lBOVeCCV5oF1KOvQb417ukbRj1OdogfFKXclpvoJHASawlgTe2Rm
 co4j1M3+uPWQ8QE2IAoiO8tzIcPPMfo8=
X-Gm-Gg: AeBDievczl/VKMX51+5SNmwIB9fXChNyEdTQay+E6+4EOHP+7EMnv9fLPGWGZ/sthjk
 UsgC9bIVpKylJ/qxVPyqebCpIJLphr/BiGPDyGMakRMIVWxhIUxeaB6NSz1WmVncpUEh0IQMceQ
 OLDTXG+CJclhKDGDHpK5ykl6EPKKpIvUX5ZQbIhfBENni4TgQ3swj9ItnPo9GDdM8EdcTBym9SU
 dfZ1fkDwc/sTy+UNgY7JWK5lnSaD2XXsFv+T0oiEIZtQ8roNmbgvumA8cHwK+VmvffCTarZDila
 jJg7zZNL+K9i5Rbu9fSE8WfTthKfrDE+v+x+DPI=
X-Received: by 2002:a05:6000:15e0:b0:43d:1c75:db70 with SMTP id
 ffacd0b85a97d-43d1c75dc44mr7692327f8f.15.1775148835462; Thu, 02 Apr 2026
 09:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <20260402080542.293e8729@kernel.org>
In-Reply-To: <20260402080542.293e8729@kernel.org>
From: Sam Edwards <cfsworks@gmail.com>
Date: Thu, 2 Apr 2026 09:53:43 -0700
X-Gm-Features: AQROBzCjWRVG4OPIJXMJdioZXiZLwrE45OlbnJvHM-A6xPnlux3hujAChNQ6Gwo
Message-ID: <CAH5Ym4j5peYXc5c9ycJzimy26Tv+4x18hyy+j-H4v7PyWuWhtA@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v4 0/2] stmmac crash/stall fixes when
	under memory pressure
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,lunn.ch,google.com,st.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	NEURAL_SPAM(0.00)[0.158];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: CF98538C376
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA4OjA14oCvQU0gSmFrdWIgS2ljaW5za2kgPGt1YmFAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gSSBtZWFudCB3ZSBuZWVkIGJvdGggYSB0aHJlc2hvbGQsIGFuZCBh
IGRlbGF5IDooCgpIaSBKYWt1YiAtIGdvdCBpdDogd2hlbiB0aGUgY3JpdGljYWwgdGhyZXNob2xk
IGlzIHJlYWNoZWQsIGFsbG93IHRoZQpOQVBJIGluc3RhbmNlIHRvIHNsZWVwIGFuZCBzdGFydCBh
IHRpbWVyIGluc3RlYWQuCgoxKSBXZSdkIGVpdGhlciBoYXZlIHRvIGxlYXZlIGludGVycnVwdHMg
bWFza2VkIG9yIGxldCB0aGVtIHJhY2UKYWdhaW5zdCB0aGUgdGltZXIuIEVpdGhlciBvbmUgaXMg
bWFuYWdlYWJsZSwgYnV0IEkgZmVlbCBsaWtlIHRob3NlCmludGVyYWN0aW9ucyBjYXJyeSAqanVz
dCogZW5vdWdoIHJlZ3Jlc3Npb24gcmlzayB0byBidW1wIHRoYXQgcGF0Y2ggdG8KLW5leHQuCgoy
KSBDb3VsZCB5b3UgcG9pbnQgb3V0IHdoaWNoIE5BUEkgZHJpdmVyIGJlc3QgaGFuZGxlcyB0aGlz
IHNpdHVhdGlvbj8KSSdkIGxpa2UgdG8gcmVwbGljYXRlIGl0cyBhcHByb2FjaC4KClRoYW5rcywK
U2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
