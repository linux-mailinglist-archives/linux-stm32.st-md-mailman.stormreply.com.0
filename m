Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M9gFMKuu2k8mgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 09:07:30 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBB42C7A6E
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 09:07:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9EE3C87ED3;
	Thu, 19 Mar 2026 08:07:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02BD0C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 08:07:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 26D82600AD;
 Thu, 19 Mar 2026 08:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77302C19424;
 Thu, 19 Mar 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773907646;
 bh=/eggGJc8w0dVMpTXWMeYMFm/znwA+edXs/5l6qyW4PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yqv2xAS9fjzDIa7+qFMFWEC3da1aX7vqYq3Nm7gvhUEnG0sIodlyG5dShrFBWRyZb
 kcCgtrw/+Zsppc5EMEN2Pz2HFIfNmMbs0Rid6utUuSOgXEZfT2tty4+Q5480DeMcAO
 cJZRPVTeSRVKHUyK5HdiJqua0tr12r0BGKFnU50su6MR+YRH78Za65A4Veqh57N1Sw
 9dXnkVUTpeeHxIeY9p2gsfWrrV9YSYEgogVN6D1+cXz5vZeib1RfsN5b+31oUMWllR
 wFRreAhlODAlh7IyNtSGCNaPekZgTtIVMjq1OMW9nzXYuu8yQRRP4GTeimdBVrpadm
 1aRZZYmhSNzsQ==
Date: Thu, 19 Mar 2026 09:07:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20260319-fiery-onyx-serval-aceb17@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v21 0/6] Introduction of a remoteproc tee
 to load signed firmware
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:arnaud.pouliquen@foss.st.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:op-tee@lists.trustedfirmware.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh+dt@kernel.org,m:sumit.garg@kernel.org,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.449];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,0.0.0.0:email]
X-Rspamd-Queue-Id: EBBB42C7A6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMDc6MDM6MjFQTSArMDEwMCwgQXJuYXVkIFBvdWxpcXVl
biB3cm90ZToKPiAKPiBNYWluIHVwZGF0ZXMgZnJvbSB2ZXJzaW9uIFYyMFs0XToKPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFRvIGFkZHJlc3MgUm9i4oCZcyBjb25jZXJuIG9u
IHYyMGNvbmNlcm5pbmcgcmVzb3VyY2UgZGVjbGFyYXRpb24gdW5kZXIgdGhlCj4gdGVlIG5vZGUs
IHRoZSBkZXZpY2UgdHJlZSBpcyBub3cgc3RydWN0dXJlZCBhcyBmb2xsb3dzLHJlcGxhY2luZyB0
aGUKPiBjaGlsZC1wYXJlbnQgaGllcmFyY2h5IHdpdGggYSBwaGFuZGxlOgo+IAo+ICAgICBmaXJt
d2FyZSB7Cj4gICAgICAgICB0ZWVfcnByb2M6IG9wdGVlLXJwcm9jIHsKPiAgICAgICAgICAgICBj
b21wYXRpYmxlID0gIjgwYTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCI7Cj4gICAg
ICAgICB9Owo+ICAgICB9Owo+IAoKQW5kIHdoYXQgaXMgdGhlIHBhcmVudCBoZXJlPwoKPiAgICAg
bTQ6IG00QDAgewoKV2hhdCBzb3J0IG9mIGJ1cyBkbyB5b3UgaGF2ZSBoZXJlIChJT1csIHdoYXQg
ZG9lcyB0aGlzIDAgbWVhbj8pCgo+ICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEtbTQt
dGVlIjsKPiAgICAgICByZWcgPSA8MCAwPjsKPiAKPiAgICAgICBtYm94ZXMgPSA8JmlwY2MgMD4s
IDwmaXBjYyAxPiwgPCZpcGNjIDI+Owo+ICAgICAgIG1ib3gtbmFtZXMgPSAidnEwIiwgInZxMSIs
ICJzaHV0ZG93biI7Cj4gCj4gICAgICAgbWVtb3J5LXJlZ2lvbiA9IDwmdmRldjB2cmluZzA+LCA8
Jm1faXBjX3NobT4sIDwmbWN1cmFtMj4sCj4gICAgICAgICAgICAgICAgICAgICAgIDwmdmRldjB2
cmluZzE+LCA8JnZkZXYwYnVmZmVyPiwgPCZyZXRyYW0+Owo+IAo+ICAgICAgIGludGVycnVwdC1w
YXJlbnQgPSA8JmV4dGk+Owo+ICAgICAgIGludGVycnVwdHMgPSA8NjggMT47Cj4gCj4gICAgICAg
cnByb2MtdGVlLXBoYW5kbGUgPSA8JnRlZV9ycHJvYyAwPjsKPiAgICAgICBzdCxhdXRvLWJvb3Q7
Cj4gICAgICAgd2FrZXVwLXNvdXJjZTsKPiAKPiAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gICAg
IH07CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
