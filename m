Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPQEK6dDhmmbLQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 20:40:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 488DC102DD0
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 20:40:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9227C87EDD;
	Fri,  6 Feb 2026 19:40:22 +0000 (UTC)
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8172C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Feb 2026 19:40:20 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 27143 invoked from network);
 6 Feb 2026 20:40:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1770406819; bh=+EvUkGikLGBVG5LNiJdmoCiaus9vguvrveELNY97Pqw=;
 h=Subject:To:Cc:From;
 b=SqeEpPv0BlEAhNqth5R+pVW07rUJPFpn9MKv+CRwCBlV+Av025KXHqFyldMsUnekl
 kELamoDdM004EiEZAeAdzO856R0hOxfrJ6zJcQ+nJsz88rDpqGYQuVyL4GSXqI5D0w
 imC9WEP6L4hQerhQEIj6fK8u9+HtD1iNzWpo64Xn5hJ6RMfVGKvFIcaSFxaCCb96GD
 b9koQkkdkEbHQRzzgoIwaiMnga39Z3OkhEqlA2f2fkR69snEXSOvrLdoxGo36KdV8r
 4lKpLbT1klOAmlMioz/iHDQGk8MCoh3Xcv6NyfaD66eZhpXysYvlKQxIFfcJ6RJEWz
 mHdFXapvGoRSw==
Received: from 83.5.238.100.ipv4.supernova.orange.pl (HELO [192.168.3.246])
 (olek2@wp.pl@[83.5.238.100]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 6 Feb 2026 20:40:19 +0100
Message-ID: <3622af67-b083-488a-998a-29b8657be73a@wp.pl>
Date: Fri, 6 Feb 2026 20:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20260201112834.3378-1-olek2@wp.pl>
 <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <aYXKFtmVJCCZpUVw@gondor.apana.org.au>
X-WP-MailID: 5428d022556c331c140129cf87531499
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [YNM0]                               
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
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wp.pl:mid,wp.pl:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 488DC102DD0
X-Rspamd-Action: no action

SGkgSGVyYmVydCwKCk9uIDIvNi8yNiAxMjowMSwgSGVyYmVydCBYdSB3cm90ZToKPiBPbiBTdW4s
IEZlYiAwMSwgMjAyNiBhdCAxMjoyNzowOFBNICswMTAwLCBBbGVrc2FuZGVyIEphbiBCYWprb3dz
a2kgd3JvdGU6Cj4+IFRlc3QgdmVjdG9yIHdhcyBnZW5lcmF0ZWQgdXNpbmcgYSBzb2Z0d2FyZSBp
bXBsZW1lbnRhdGlvbiBhbmQgdGhlbiBkb3VibGUKPj4gY2hlY2tlZCB1c2luZyBhIGhhcmR3YXJl
IGltcGxlbWVudGF0aW9uIG9uIE5YUCBQMjAyMCAodGFsaXRvcykuIFRoZQo+PiBlbmNyeXB0aW9u
IHBhcnQgaXMgaWRlbnRpY2FsIHRvIGF1dGhlbmMoaG1hYyhzaGExKSxjYmMoZGVzM19lZGUpKSwK
Pj4gb25seSBITUFDIGlzIGRpZmZlcmVudC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWxla3NhbmRl
ciBKYW4gQmFqa293c2tpIDxvbGVrMkB3cC5wbD4KPj4gLS0tCj4+ICAgY3J5cHRvL3Rlc3RtZ3Iu
YyB8ICA3ICsrKysrKwo+PiAgIGNyeXB0by90ZXN0bWdyLmggfCA1OSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDY2
IGluc2VydGlvbnMoKykKPiBQYXRjaCBhcHBsaWVkLiAgVGhhbmtzLgoKV2hpbGUgcmVzb2x2aW5n
IHRoZSBjb25mbGljdCwgdGhlIGVudHJ5IHdhcyBhZGRlZCBpbiB0aGUgd3JvbmcgcGxhY2UuIEFz
IGEKcmVzdWx0LCB0aGUgdGVzdCBtYW5hZ2VyIGNvbXBsYWlucyBhYm91dCBzb3J0aW5nOgpbwqAg
wqAgMC4wNTA4OTFdIHRlc3RtZ3I6IGFsZ190ZXN0X2Rlc2NzIGVudHJpZXMgaW4gd3Jvbmcgb3Jk
ZXI6IAonYXV0aGVuYyhobWFjKG1kNSksZWNiKGNpcGhlcl9udWxsKSknIGJlZm9yZSAKJ2F1dGhl
bmMoaG1hYyhtZDUpLGNiYyhkZXMzX2VkZSkpJwoKU2hvdWxkIEkgc2VuZCBhIHBhdGNoIHRvIGZp
eCB0aGUgc29ydGluZz8gT3Igd291bGQgeW91IHByZWZlciB0byByZXBsYWNlCnRoZSBwYXRjaCBp
biB5b3VyIHRyZWUgYW5kIGFwcGx5IFsxXSBmaXJzdCwgdGhlbiBbMl0/IFRoYXQgd2F5IHRoZXJl
IHNob3VsZApiZSBubyBjb25mbGljdHMuCgoxLiAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LWNyeXB0by9wYXRjaC8yMDI2MDEzMTE3NDAyMC4zNjcwLTEtb2xlazJA
d3AucGwvCjIuIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtY3J5
cHRvL3BhdGNoLzIwMjYwMjAxMTEyODM0LjMzNzgtMS1vbGVrMkB3cC5wbC8KCkJlc3QgcmVnYXJk
cywKQWxla3NhbmRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
