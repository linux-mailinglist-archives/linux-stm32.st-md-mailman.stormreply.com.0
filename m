Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN8NCd4uGGrUfggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 14:02:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E77635F1C67
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 14:02:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95C22C8F28E;
	Thu, 28 May 2026 12:02:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D412FC8F287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2026 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779969744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwpPKrXQ70T1twLFwNf8lR/i2OUb1jZoS9ZO8mh+Lqw=;
 b=FTAExcmYCSJNQ/hmg7FsGBQ1RcCwO3Q/f8NMy7TYULZq2HmwW5GtaV/CmVv6zS4pri1mvF
 Vq8mY2xgiKWhpLUtAL7hh1/sC3ANRZrxINBu/NJCCk3sqT4kAFhPMzx5Ycxv1SrDVHZ/N7
 oMU0tIVTH3koVLL9HM+YdCaA6VOr3S8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-pl0e5186NvS9R3RHH2gBjg-1; Thu,
 28 May 2026 08:02:20 -0400
X-MC-Unique: pl0e5186NvS9R3RHH2gBjg-1
X-Mimecast-MFC-AGG-ID: pl0e5186NvS9R3RHH2gBjg_1779969738
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5A8B819560B1; Thu, 28 May 2026 12:02:17 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.235])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B990219560AB; Thu, 28 May 2026 12:02:09 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: dinghui1111@163.com
Date: Thu, 28 May 2026 14:02:02 +0200
Message-ID: <20260528120203.245762-1-pabeni@redhat.com>
In-Reply-To: <20260526022620.501229-1-dinghui1111@163.com>
References: <20260526022620.501229-1-dinghui1111@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: YVHGgrZ7GJUyNqiUN-q8bV5H2W8NP_f27-GiL6TvR20_1779969738
X-Mimecast-Originator: redhat.com
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, xiasanbo@lixiang.com,
 dinghui@lixiang.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, edumazet@google.com, yangchen11@lixiang.com,
 mcoquelin.stm32@gmail.com, liuxuanjun@lixiang.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix fatal bus error on
	resume by reinitializing RX buffers
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
X-Spamd-Result: default: False [5.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[163.com];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:dinghui1111@163.com,m:andrew@lunn.ch,m:linux-kernel@vger.kernel.org,m:xiasanbo@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:yangchen11@lixiang.com,m:mcoquelin.stm32@gmail.com,m:liuxuanjun@lixiang.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,lixiang.com,st-md-mailman.stormreply.com,bootlin.com,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RSPAMD_URIBL_FAIL(0.00)[linux.dev:query timed out];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.633];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: E77635F1C67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RnJvbTogQUkgUmV2aWV3ZXIgPGFpQGV4YW1wbGUuY29tPgoKVGhpcyBpcyBhbiBBSS1nZW5lcmF0
ZWQgcmV2aWV3IG9mIHlvdXIgcGF0Y2guIFRoZSBodW1hbiBzZW5kaW5nIHRoaXMKZW1haWwgaGFz
IGNvbnNpZGVyZWQgdGhlIEFJIHJldmlldyB2YWxpZCwgb3IgYXQgbGVhc3QgcGxhdXNpYmxlLgpG
dWxsIHJldmlldyBhdDogaHR0cHM6Ly9uZXRkZXYtYWkuYm90cy5saW51eC5kZXYvc2FzaGlrby8K
LS0tCm5ldDogc3RtbWFjOiBmaXggZmF0YWwgYnVzIGVycm9yIG9uIHJlc3VtZSBieSByZWluaXRp
YWxpemluZyBSWCBidWZmZXJzCgpUaGlzIHBhdGNoIGFkZHMgc3RtbWFjX3JlaW5pdF9yeF9kZXNj
cmlwdG9ycygpIGFuZCBjYWxscyBpdCBmcm9tCnN0bW1hY19yZXN1bWUoKSBiZWZvcmUgc3RtbWFj
X2NsZWFyX2Rlc2NyaXB0b3JzKCkgdG8gcmUtcHJvZ3JhbSB0aGUgUlgKZGVzY3JpcHRvciBidWZm
ZXItYWRkcmVzcyBmaWVsZHMgZnJvbSBidWZmZXJzIHRoYXQgc3Vydml2ZWQgYWNyb3NzIHRoZQpQ
TSB0cmFuc2l0aW9uLCBhdm9pZGluZyBhbnkgYWxsb2NhdGlvbiBpbiB0aGUgcmVzdW1lIHBhdGgu
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwo+IGluZGV4IDM1OTE3NTVlYTMwYi4uMGRjMjdkOGM2NmEwIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gQEAgLTE2
NDIsNiArMTY0Miw3OSBAQCBzdGF0aWMgdm9pZCBzdG1tYWNfY2xlYXJfZGVzY3JpcHRvcnMoc3Ry
dWN0IHN0bW1hY19wcml2ICpwcml2LAo+ICAJCXN0bW1hY19jbGVhcl90eF9kZXNjcmlwdG9ycyhw
cml2LCBkbWFfY29uZiwgcXVldWUpOwo+ICB9Cj4gIAo+ICsvKioKPiArICogc3RtbWFjX3JlaW5p
dF9yeF9kZXNjcmlwdG9ycyAtIHJlLXByb2dyYW0gUlggZGVzY3JpcHRvcnMgZnJvbSBleGlzdGlu
Zwo+ICsgKgkJCQkgICBidWZmZXJzIChhbGxvY2F0aW9uLWZyZWUpCgpbIC4uLiBdCgo+ICtzdGF0
aWMgdm9pZCBzdG1tYWNfcmVpbml0X3J4X2Rlc2NyaXB0b3JzKHN0cnVjdCBzdG1tYWNfcHJpdiAq
cHJpdiwKPiArCQkJCQkgc3RydWN0IHN0bW1hY19kbWFfY29uZiAqZG1hX2NvbmYsCj4gKwkJCQkJ
IHUzMiBxdWV1ZSkKPiArewo+ICsJc3RydWN0IHN0bW1hY19yeF9xdWV1ZSAqcnhfcSA9ICZkbWFf
Y29uZi0+cnhfcXVldWVbcXVldWVdOwo+ICsJaW50IGk7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8
IGRtYV9jb25mLT5kbWFfcnhfc2l6ZTsgaSsrKSB7Cj4gKwkJc3RydWN0IHN0bW1hY19yeF9idWZm
ZXIgKmJ1ZiA9ICZyeF9xLT5idWZfcG9vbFtpXTsKPiArCQlzdHJ1Y3QgZG1hX2Rlc2MgKnAgPSBz
dG1tYWNfZ2V0X3J4X2Rlc2MocHJpdiwgcnhfcSwgaSk7Cj4gKwo+ICsJCWlmIChyeF9xLT54c2tf
cG9vbCkgewo+ICsJCQlkbWFfYWRkcl90IGRtYV9hZGRyOwo+ICsKPiArCQkJLyogVGhlIFhTSyBw
b29sIG1heSBub3QgYmUgZnVsbHkgcG9wdWxhdGVkIChlLmcuCj4gKwkJCSAqIHhkcHNvY2sgVFgt
b25seSk7IHNraXAgZW1wdHkgc2xvdHMuCj4gKwkJCSAqLwo+ICsJCQlpZiAoIWJ1Zi0+eGRwKQo+
ICsJCQkJY29udGludWU7CgpbSGlnaF0KRG9lcyB0aGUgY29udGludWUgaGVyZSByZWdyZXNzIHRv
IHRoZSBzYW1lIGZhdGFsIGJ1cyBlcnJvciB0aGlzIHBhdGNoCnNldHMgb3V0IHRvIGZpeD8KCldo
ZW4gdGhlIHNsb3QgaXMgc2tpcHBlZCwgaXRzIGRlc2NyaXB0b3IgYWRkcmVzcyBmaWVsZHMga2Vl
cCB3aGF0ZXZlcgpIVyB3cml0ZWJhY2sgbGVmdCBiZWhpbmQuIFRoZW4gc3RtbWFjX2NsZWFyX2Rl
c2NyaXB0b3JzKCkgcnVucyByaWdodAphZnRlciBzdG1tYWNfcmVpbml0X3J4X2Rlc2NyaXB0b3Jz
KCkgaW4gc3RtbWFjX3Jlc3VtZSgpIGFuZCB1bmNvbmRpdGlvbmFsbHkKcmUtYXJtcyBPV04gb24g
ZXZlcnkgc2xvdC4gRm9yIGR3bWFjNCB0aGF0IGlzIGR3bWFjNF9zZXRfcnhfb3duZXIoKToKCglw
LT5kZXMzIHw9IGNwdV90b19sZTMyKFJERVMzX09XTiB8IFJERVMzX0JVRkZFUjFfVkFMSURfQURE
UiB8CgkJCSAgICAgICBSREVTM19JTlRfT05fQ09NUExFVElPTl9FTik7CgphbmQgZm9yIGVuaF9k
ZXNjIC8gbmRlc2MgdGhlIGVxdWl2YWxlbnQgT1Igb2YgUkRFUzBfT1dOIC8gUkRFUzEgZmllbGRz
LgpOb25lIG9mIHRoZXNlIGNsZWFyIHRoZSBhZGRyZXNzIGZpZWxkcy4KCldoZW4gc3RtbWFjX2h3
X3NldHVwKCkgcmVzdGFydHMgdGhlIERNQSwgdGhlIGNvbnRyb2xsZXIgc2VlcyBhbiBvd25lZApk
ZXNjcmlwdG9yIHdpdGggVkFMSURfQUREUiBzZXQgYW5kIGEgc3RhbGUgYWRkcmVzcyDigJQgdGhl
IGV4YWN0IGZhaWx1cmUKbW9kZSB0aGUgY29tbWl0IG1lc3NhZ2UgZGVzY3JpYmVzLiBDb3VsZCB0
aGUgc2tpcHBlZCBzbG90cyBiZSBjbGVhcmVkCihzdG1tYWNfY2xlYXJfZGVzYygpIG9yIHplcm9p
bmcgZGVzMC9kZXMxL2RlczIpIGluc3RlYWQgb2YgbGVmdCBpbnRhY3QsCm9yIGFycmFuZ2VkIHNv
IGNsZWFyX2Rlc2NyaXB0b3JzKCkgZG9lcyBub3QgYXJtIE9XTiBvbiB0aGVtPwoKPiArCj4gKwkJ
CWRtYV9hZGRyID0geHNrX2J1ZmZfeGRwX2dldF9kbWEoYnVmLT54ZHApOwo+ICsJCQlzdG1tYWNf
c2V0X2Rlc2NfYWRkcihwcml2LCBwLCBkbWFfYWRkcik7Cj4gKwkJCXN0bW1hY19zZXRfZGVzY19z
ZWNfYWRkcihwcml2LCBwLCAwLCBmYWxzZSk7Cj4gKwkJfSBlbHNlIHsKPiArCQkJLyogVGhlb3Jl
dGljYWxseSB1bnJlYWNoYWJsZTogbmFwaV9kaXNhYmxlKCkgaW4KPiArCQkJICogc3RtbWFjX3N1
c3BlbmQoKSBlbnN1cmVzIGFsbCBpbml0aWFsaXplZCBzbG90cwo+ICsJCQkgKiBoYXZlIGEgdmFs
aWQgcGFnZSBiZWZvcmUgd2UgZ2V0IGhlcmUuCj4gKwkJCSAqIERlZmVuc2l2ZSBjaGVjayBvbmx5
Lgo+ICsJCQkgKi8KPiArCQkJaWYgKCFidWYtPnBhZ2UpCj4gKwkJCQljb250aW51ZTsKCltIaWdo
XQpJcyB0aGUgY29tbWVudCAiVGhlb3JldGljYWxseSB1bnJlYWNoYWJsZTogbmFwaV9kaXNhYmxl
KCkgaW4Kc3RtbWFjX3N1c3BlbmQoKSBlbnN1cmVzIGFsbCBpbml0aWFsaXplZCBzbG90cyBoYXZl
IGEgdmFsaWQgcGFnZSIKYWNjdXJhdGU/CgpzdG1tYWNfcngoKSBhc3NpZ25zIGJ1Zi0+cGFnZSA9
IE5VTEwgYXQgbXVsdGlwbGUgcG9pbnRzIHdoZW4gaGFuZGluZyB0aGUKcGFnZSBvbiB0byB0aGUg
c3RhY2sgb3IgdG8gWERQLCBmb3IgZXhhbXBsZToKCglidWYtPnBhZ2UgPSBOVUxMOwoKaW4gc3Rt
bWFjX3J4KCkgYWZ0ZXIgdGhlIHBhZ2UgaGFzIGJlZW4gY29uc3VtZWQuCgpzdG1tYWNfcnhfcmVm
aWxsKCkgYWxsb2NhdGVzIHdpdGggR0ZQX0FUT01JQyB8IF9fR0ZQX05PV0FSTiBhbmQgYnJlYWtz
Cm9uIGFsbG9jYXRpb24gZmFpbHVyZSB3aXRob3V0IGFkdmFuY2luZyBkaXJ0eV9yeCwgbGVhdmlu
ZyB0aGUgZmFpbGluZwpzbG90IChhbmQgYW55IHN1YnNlcXVlbnQgc2xvdHMpIHdpdGggYnVmLT5w
YWdlID09IE5VTEw6CgoJaWYgKCFidWYtPnBhZ2UpIHsKCQlidWYtPnBhZ2UgPSBwYWdlX3Bvb2xf
YWxsb2NfcGFnZXMocnhfcS0+cGFnZV9wb29sLCBnZnApOwoJCWlmICghYnVmLT5wYWdlKQoJCQli
cmVhazsKCQkuLi4KCX0KCnN0bW1hY19kaXNhYmxlX2FsbF9xdWV1ZXMoKSBvbmx5IGRvZXMgc3lu
Y2hyb25pemVfcmN1KCkgYW5kCm5hcGlfZGlzYWJsZSgpIOKAlCBpdCBkb2VzIG5vdCByZXRyeSBy
ZWZpbGxzLiBVbmRlciB0aGUgbWVtb3J5LXByZXNzdXJlCnNjZW5hcmlvIHRoaXMgcGF0Y2ggaXMg
ZXhwbGljaXRseSBkZXNpZ25lZCB0byBtYWtlIHNhZmUsIGEgcHJpb3IKR0ZQX0FUT01JQyBmYWls
dXJlIGNhbiBsZWF2ZSB0aGUgcmluZyB3aXRoIE5VTEwtcGFnZSBzbG90cyBhdCB0aGUKbW9tZW50
IHN1c3BlbmQgaGFwcGVucy4KCklmIHN1Y2ggYSBzbG90IGlzIHRoZW4gc2tpcHBlZCBoZXJlLCB0
aGUgc2FtZSBPV04td2l0aC1zdGFsZS1hZGRyZXNzCmNvbmRpdGlvbiBkZXNjcmliZWQgYWJvdmUg
YXBwbGllcyBvbiByZXN1bWUuIFNob3VsZCB0aGUgcGFnZV9wb29sIHBhdGgKYWxzbyBjbGVhciB0
aGUgZGVzY3JpcHRvciBmb3Igc2tpcHBlZCBzbG90cywgb3IgYWxsb2NhdGUgYSByZXBsYWNlbWVu
dApidWZmZXIgcmF0aGVyIHRoYW4gbGVhdmUgYSBzdGFsZS1hZGRyZXNzIGRlc2NyaXB0b3IgZm9y
CnN0bW1hY19jbGVhcl9kZXNjcmlwdG9ycygpIHRvIGFybT8KCj4gKwo+ICsJCQlzdG1tYWNfc2V0
X2Rlc2NfYWRkcihwcml2LCBwLCBidWYtPmFkZHIpOwo+ICsJCQlzdG1tYWNfc2V0X2Rlc2Nfc2Vj
X2FkZHIocHJpdiwgcCwgYnVmLT5zZWNfYWRkciwKPiArCQkJCQkJIHByaXYtPnNwaF9hY3RpdmUg
JiYKPiArCQkJCQkJIGJ1Zi0+c2VjX3BhZ2UpOwo+ICsKPiArCQkJaWYgKGRtYV9jb25mLT5kbWFf
YnVmX3N6ID09IEJVRl9TSVpFXzE2S2lCKQo+ICsJCQkJc3RtbWFjX2luaXRfZGVzYzMocHJpdiwg
cCk7Cj4gKwkJfQo+ICsJfQoKWyAuLi4gXQoKPiArfQo+ICsKLS0gClRoaXMgaXMgYW4gQUktZ2Vu
ZXJhdGVkIHJldmlldy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
