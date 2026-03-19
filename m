Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eALAEKj1u2nkqQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:10:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA02CBAEA
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:09:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9551FC87ECE;
	Thu, 19 Mar 2026 13:09:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3326C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:09:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2E6F440FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B010EC2BCB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773925797;
 bh=Ts/ZBzEhwzBq6L1alBpL4MrUmv33n0V3E/Ul5uCiuTo=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=RacmPq1bIqMeMcyhxiEK10j6ygmP3LMQK2Z2fVE3HCOxsgvgXy03lL3FuvuLQQvgj
 GiQcbk0Gc68ea8eJ4LngePUDz9C5XojYstENdaRQM1y0oSw68pXH0FB/x9xYOoXLj5
 yzHUkBwYEvcieaKcpfVCPm7nVCORUUsT0yOyNlGzfZbyxsZTMYNRLeKm/6/LsH6iAi
 g+KwM2FKgeEjnQE4mZhq0fF6zUla5vAiMm1h5fjWA7LIX/ZFlm4NfZRaEHQvb0eRdn
 ro9atKpn/5SRW63zxRDjmZnik2psm1mFQ05jHWL2srdHA6o0dMoRIWg/vWUDnwIL81
 7blFfhRQzZ9RQ==
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-38b3ee785a5so7626731fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 06:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVnkzZLeL+hbYg9lV4Hq0Z0Ax0bpDZZaShi/+2IvkQvK9C6W05kYer1C16zNDARZjO32wAPgjbXUxM0iQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXyR9FbrjiQ8bkk7rsDNHqOBsREY3CxqBgOfvgq1yATUnKkygp
 PB3S5LOGZVhulOjBlVifvDOOKwgFNIceyy0lsKIG2x/AcBZR97nCzIyTScqoc5qPxdaaJaxR1Wt
 EwECpUomkBZ74t0MamTd2mHwtMAgbseQ=
X-Received: by 2002:a05:651c:324f:b0:38a:d354:cb2a with SMTP id
 38308e7fff4ca-38be5f51b90mr10131901fa.18.1773925796044; Thu, 19 Mar 2026
 06:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
 <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:09:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
X-Gm-Features: AaiRm52DzwyqScnSD_1lE5a2W4uRQaDkIK3TFFUruN1gvKxXkVMyOzXMy0U3Fs4
Message-ID: <CAGb2v67j91R7vsY2WOjgWQxyD-2Y8mRXe1go-F2jsL+9vbrBPQ@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 11/15] hwspinlock: move entries from
	internal to public header
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:mcoquelin.stm32@gmail.com,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:wilken.gottwalt@posteo.net,m:baolin.wang@linux.alibaba.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:linux-omap@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:wsa@sang-engineering.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,sholland.org,kernel.org,vger.kernel.org,posteo.net,linux.alibaba.com,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_SPAM(0.00)[0.800];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,sang-engineering.com:email]
X-Rspamd-Queue-Id: D2FA02CBAEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNzowMOKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gUHJvdmlkZXJzIG5lZWQgdGhlIG9w
cy1zdHJ1Y3R1cmUgYW5kIHRoZSBod2xvY2tfdG9faWQtZnVuY3Rpb24uIE1vdmUKPiB0aGVzZSBl
bnRyaWVzIHRvIHRoZSBwdWJsaWMgaGVhZGVyLiBXaXRoIHRoaXMgY2hhbmdlLCBhbGwgcHJvdmlk
ZXJzIGFyZQo+IGFsc28gdXBkYXRlZCB0byB1c2UgdGhlIHB1YmxpYyBoZWFkZXIgb25seS4gVGhl
IGludGVybmFsIGhlYWRlciBpcyBub3cKPiB1c2VkIGJ5IHRoZSBjb3JlIG9ubHkuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19jb3JlLmMgICAgIHwgIDgg
KysrKysrKwo+ICBkcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19pbnRlcm5hbC5oIHwgMjkg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvaHdzcGlubG9jay9vbWFwX2h3c3Bp
bmxvY2suYyAgICAgfCAgMiAtLQo+ICBkcml2ZXJzL2h3c3BpbmxvY2svcWNvbV9od3NwaW5sb2Nr
LmMgICAgIHwgIDIgLS0KPiAgZHJpdmVycy9od3NwaW5sb2NrL3NwcmRfaHdzcGlubG9jay5jICAg
ICB8ICAyIC0tCj4gIGRyaXZlcnMvaHdzcGlubG9jay9zdG0zMl9od3NwaW5sb2NrLmMgICAgfCAg
MiAtLQoKPiAgZHJpdmVycy9od3NwaW5sb2NrL3N1bjZpX2h3c3BpbmxvY2suYyAgICB8ICAyIC0t
CgpBY2tlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5vcmc+ICMgZm9yIHN1bjZpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
