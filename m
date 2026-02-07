Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6zFwHs1Mh2lMWAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Feb 2026 15:31:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EB7106289
	for <lists+linux-stm32@lfdr.de>; Sat, 07 Feb 2026 15:31:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95CB4C8F261;
	Sat,  7 Feb 2026 14:31:40 +0000 (UTC)
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5792DC87ECF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Feb 2026 14:31:39 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 11881 invoked from network);
 7 Feb 2026 15:31:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1770474698; bh=tKfz8khjNl/LTu3C6GNZbX7HdCtyRoxHHXHrzIGrMME=;
 h=Subject:To:Cc:From;
 b=Pb8CnKdlS/CPgQk4qAreqcA8wUwE4yRtmJNyM5nfU3l8ZQU/FbcS8iIlIrwEjUph+
 9RI3eP7L9OzuTfVrH3EO0YWhF8BoVRJBgpX153dlhAFHyPeI7F1+kGmuss0Lp4PJDS
 YD/CwaZgd4abkL76lfvLSs2kfMfg4qoNbt+aP+oNP2v7yGyBlSnL2nvvBEeik7ysz3
 6ilI2k6fJMVwA16jgmYHZM3vKmZfEi+2gEU1BS30/ZheroWEtnAC+DOJbzuWRNrhV9
 ZnEWNo4QhE/WemtCQzlp66k36rnUqU5vHRnqWHnPIzWr62WPealH8ihnGw+EacDobZ
 T4IxAXGauDg4Q==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO [192.168.3.246])
 (olek2@wp.pl@[83.5.238.100]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 7 Feb 2026 15:31:38 +0100
Message-ID: <4be44ce1-6e46-4fc7-9497-7a99f8e54047@wp.pl>
Date: Sat, 7 Feb 2026 15:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20260201112834.3378-1-olek2@wp.pl>
 <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
 <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
 <aYaWWy2KSYz787a-@gondor.apana.org.au>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <aYaWWy2KSYz787a-@gondor.apana.org.au>
X-WP-MailID: affa130d7d053aabd69a05928304064c
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [gJP0]                               
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: testmgr - Add test vectors for
 authenc(hmac(md5), cbc(des3_ede))
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[wp.pl:s=20241105];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[wp.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[wp.pl];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wp.pl:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wp.pl:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 07EB7106289
X-Rspamd-Action: no action

Ck9uIDIvNy8yNiAwMjozMywgSGVyYmVydCBYdSB3cm90ZToKPiBPbiBGcmksIEZlYiAwNiwgMjAy
NiBhdCAwODo0MDoxOFBNICswMTAwLCBBbGVrc2FuZGVyIEphbiBCYWprb3dza2kgd3JvdGU6Cj4+
IFdoaWxlIHJlc29sdmluZyB0aGUgY29uZmxpY3QsIHRoZSBlbnRyeSB3YXMgYWRkZWQgaW4gdGhl
IHdyb25nIHBsYWNlLiBBcyBhCj4+IHJlc3VsdCwgdGhlIHRlc3QgbWFuYWdlciBjb21wbGFpbnMg
YWJvdXQgc29ydGluZzoKPj4gW8KgIMKgIDAuMDUwODkxXSB0ZXN0bWdyOiBhbGdfdGVzdF9kZXNj
cyBlbnRyaWVzIGluIHdyb25nIG9yZGVyOgo+PiAnYXV0aGVuYyhobWFjKG1kNSksZWNiKGNpcGhl
cl9udWxsKSknIGJlZm9yZQo+PiAnYXV0aGVuYyhobWFjKG1kNSksY2JjKGRlczNfZWRlKSknCj4g
VGhhbmtzIGZvciB0aGUgaGVhZHMgdXAuICBJJ3ZlIGp1c3QgcHVzaGVkIG91dCBhIGZpeCwgY2Fu
IHlvdQo+IHBsZWFzZSBkb3VibGUtY2hlY2s/Ckl0J3MgZmluZSBub3cuIFRoYW5rcy4KCgo+Cj4g
Q2hlZXJzLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
