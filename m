Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kSyQJ63+J2qP6wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:53:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064165FB29
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="Lp+/ZzVP";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B856C90087;
	Tue,  9 Jun 2026 11:53:17 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473A9C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 07:57:24 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-36b903567fdso1539528a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jun 2026 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780646243; x=1781251043;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ypRXmfNw4AH7NGaRxQ71Nt3S+wAEO8XxXRpJWlgrK/o=;
 b=Lp+/ZzVPD1GUtDG7bEKc+YNzCIYZs6Obc9DJErnWxAuIYVpYNWZ1PYl2rM24t0Rc07
 fbQPah7lVQ+npe7WMOfgvgmwaPv+x5TK4zGEwdbkU1MMtOdHI6w3i7uYFJ+kq9HoWs6C
 PgIN+Qjpwt3QCwfpu478ZB6U/bNpssNgCQWMARdY4m94kx/movMi6kOPkPPX54a+D/Pc
 Kylx1qZnVGo7b6Fm1ySp2J4NvpkrBgS8khHdwjM1HcQhNVN3258hEu3uovV04BVE0vF9
 b63lK9QRWc8Pnu9MNxYb47OCaczgzJR3CkunHeHP67gEYjybFG2wbUQ/wNm70EISOkzh
 ijGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780646243; x=1781251043;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ypRXmfNw4AH7NGaRxQ71Nt3S+wAEO8XxXRpJWlgrK/o=;
 b=crMWSlNfrQwa6MD+Tw3Ezgwet+yAX/mzcz/yUk0A0De2RiswPaDlvw2a98PKGr1617
 /+Zkw2WdYzvW4Ad99GYSLhasTRxuz0MByB3mcoI6JQms0PFnr6IyseQ/Ec+/S+QlXkN8
 tcV4EM0WI9mwVw0nu3tXtO6q7d3Ll++iTfIiGlCdBFb6lxcPiXhMJQBTq0sQRuPcwsEQ
 ck0dnqzjpc44qYKvwb+DTaHtf0Yt3w8sBybgVziO8Mp6+I1yVqccw+CfuLOQn8hpDni7
 gHwv9ue1n/ySyxazauwAf43pB4Ysdoyc9lDRKeTV5IDzccJhdfCnyOUtg+NiLhvpH7u/
 m7lA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+L0RZWTd1i2KYibSGFZh/r9mQLNF5l5g4E84phkiZ7BlJJ8wr5ffM0SOpdrRAhBboQawe0J4qbcCYU+w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+n6BD8KBCCFmUYms9CMRwlVfqcwN51mztnD7aDKKXRHGsu9oY
 gtOC6Dgbv+nyPgp5z2rqP6L3QtsCyKSDJodJdSrMrvVrCCMpMgdVVH1N
X-Gm-Gg: Acq92OGMjnvR3+hQdRW4Wb2Ua6tSjnQG7YJXZTfsXWWK8YA5B69DDHyM1YPz/MMhI2C
 wNqRg59+P8VeZ1kCICOeXsAjFYbyjS4q/jjd9tc5qcFDAxPz8e+/pF9EXSng/Syv8eyygnOUjAT
 BedW80ylwiovGhMFm1G4bUoc1My4SykQGf7qvcXCjPdxeA1JUotiZX5XnKjKV8s7BCUAqKKMW+X
 xUbudYBjvD4ROnMFIju1+A0CvpZg6s8NQMyUAfvv1CiVYNd9lOyf4K4GvS8H26sYR2niMk3FpRV
 Tcan5OiqHMT/nnqbciTNU6kMBfxieEOlxC3tFXgOexiwI1ehFSxu1+NH3BodzXyRzT4QDkRttYb
 ieffCdBxkKiBUd39UlZ4GRyTVyBFTUOQil/V9F/pf14dA+4nluvrT7LlKMM+tZLGwSQTr4MiyYp
 Kyva1fOuWwY85qX9woT5ymsvHugLGSEGNwi3W2pyzHpiVwLyB0buklAqW5dWtoZwzMgQimLpVTF
 A==
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id
 98e67ed59e1d1-370ee82fa3cmr2367318a91.1.1780646242679; 
 Fri, 05 Jun 2026 00:57:22 -0700 (PDT)
Received: from u9dbb0cac493f51.ant.amazon.com ([50.35.61.175])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37133082519sm897559a91.1.2026.06.05.00.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 00:57:22 -0700 (PDT)
From: Carlos Fangmeier <carlos.fangmeier@gmail.com>
Date: Fri, 05 Jun 2026 00:56:35 -0700
MIME-Version: 1.0
Message-Id: <20260605-main-v1-1-aed15b1cf1af@gmail.com>
X-B4-Tracking: v=1; b=H4sIADKBImoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMT3dzEzDzdNDPLNEtTM5NEc5MkJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAMnGDJdoAAAA
X-Change-ID: 20260604-main-f69f9564a74b
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>
X-Mailer: b4 0.15.2
X-Mailman-Approved-At: Tue, 09 Jun 2026 11:53:15 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Carlos Fangmeier <carlos.fangmeier@gmail.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: prevent kernel panic during XDP
 program and XSK pool transitions
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[99];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:davem@davemloft.net,m:kuba@kernel.org,m:hawk@kernel.org,m:john.fastabend@gmail.com,m:sdf@fomichev.me,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:boon.leong.ong@intel.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:carlos.fangmeier@gmail.com,m:bpf@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:carlosfangmeier@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,davemloft.net,gmail.com,fomichev.me,lunn.ch,google.com,redhat.com,foss.st.com,intel.com];
	FORGED_SENDER(0.00)[carlosfangmeier@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carlosfangmeier@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5064165FB29

c3RtbWFjX3hkcF9zZXRfcHJvZygpIHRlYXJzIGRvd24gYW5kIHJlYnVpbGRzIGFsbCBETUEgY2hh
bm5lbHMgdmlhCnN0bW1hY194ZHBfcmVsZWFzZSgpL3N0bW1hY194ZHBfb3BlbigpIHdpdGhvdXQg
cGF1c2luZyB0aGUgbmV0ZGV2ClRYIHBhdGguIFNpbWlsYXJseSwgc3RtbWFjX3hkcF9lbmFibGVf
cG9vbCgpIGFuZApzdG1tYWNfeGRwX2Rpc2FibGVfcG9vbCgpIHJlY29uZmlndXJlIGluZGl2aWR1
YWwgcXVldWUgRE1BIHJpbmdzCndoaWxlIFRYIHJlbWFpbnMgYWN0aXZlLgoKSWYgdGhlIGtlcm5l
bCB0cmFuc21pdHMgYSBmcmFtZSBkdXJpbmcgdGhlc2Ugd2luZG93cyDigJQgZm9yIGV4YW1wbGUg
YW4KTUxEIHJlcG9ydCBxdWV1ZWQgYnkgdGhlIElQdjYgc3RhY2sg4oCUIHN0bW1hY194bWl0KCkg
Y2FsbHMKZHdtYWM0X3NldF9hZGRyKCkgYWdhaW5zdCBhbiBNTUlPIHJlZ2lzdGVyIHdob3NlIG1h
cHBpbmcgaGFzIGJlZW4KdG9ybiBkb3duLCB0cmlnZ2VyaW5nIGEgbGV2ZWwtMyB0cmFuc2xhdGlv
biBmYXVsdDoKCiAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmly
dHVhbCBhZGRyZXNzIGZmZmY4MDAwODQwZWMwMDAKICBwYyA6IGR3bWFjNF9zZXRfYWRkcisweDgv
MHgxOAogIGxyIDogc3RtbWFjX3htaXQrMHg2NGMvMHhiNjAKICBDYWxsIHRyYWNlOgogICBkd21h
YzRfc2V0X2FkZHIrMHg4LzB4MTgKICAgZGV2X2hhcmRfc3RhcnRfeG1pdCsweGIwLzB4MjIwCiAg
IHNjaF9kaXJlY3RfeG1pdCsweDEwOC8weDNmMAogICBfX2Rldl9xdWV1ZV94bWl0KzB4ODQ0LzB4
ZDAwCiAgIGlwNl9maW5pc2hfb3V0cHV0MisweDJkOC8weDYxMAogICBtbGRfc2VuZHBhY2srMHgx
ODAvMHgyZTAKICAgbWxkX2lmY193b3JrKzB4MWRjLzB4NDgwCgpUaGUgZXhpc3RpbmcgbmV0aWZf
dHhfZGlzYWJsZSgpIGluIHN0bW1hY194ZHBfcmVsZWFzZSgpIGlzIG5vdApzdWZmaWNpZW50IGJl
Y2F1c2Ugc3RtbWFjX3hkcF9vcGVuKCkgcmUtZW5hYmxlcyBUWCB2aWEKbmV0aWZfdHhfc3RhcnRf
YWxsX3F1ZXVlcygpIGJlZm9yZSB0aGUgY2FsbGVyIHJlZ2FpbnMgY29udHJvbCwgbGVhdmluZwph
IHdpbmRvdyB3aGVyZSB0aGUgZnJlc2hseSByZWJ1aWx0IHJpbmdzIGNhbiByYWNlIHdpdGggcGVu
ZGluZyBUWCB3b3JrLgoKRml4IHRoaXMgYnkgd3JhcHBpbmcgZWFjaCByZWNvbmZpZ3VyYXRpb24g
cGF0aCB3aXRoCm5ldGlmX3R4X2Rpc2FibGUoKS9uZXRpZl90eF93YWtlX2FsbF9xdWV1ZXMoKToK
CiAtIHN0bW1hY194ZHBfc2V0X3Byb2coKTogaG9sZCBUWCBkaXNhYmxlZCBhY3Jvc3MgdGhlIGZ1
bGwKICAgc3RtbWFjX3hkcF9yZWxlYXNlKCkgKyBzdG1tYWNfeGRwX29wZW4oKSBzZXF1ZW5jZSwg
b25seSB3YWtpbmcKICAgVFggYWZ0ZXIgc3RtbWFjX3hkcF9vcGVuKCkgcmV0dXJucy4KCiAtIHN0
bW1hY194ZHBfZW5hYmxlX3Bvb2woKTogZGlzYWJsZSBUWCBiZWZvcmUgdGVhcmluZyBkb3duIHRo
ZQogICBxdWV1ZSwgcmUtZW5hYmxlIGFmdGVyIHRoZSBxdWV1ZSBpcyByZWJ1aWx0IGFuZCBOQVBJ
IGlzIGFjdGl2ZS4KCiAtIHN0bW1hY194ZHBfZGlzYWJsZV9wb29sKCk6IHNhbWUgcGF0dGVybiBh
cm91bmQgdGhlIHBvb2wgdGVhcmRvd24KICAgYW5kIHF1ZXVlIHJlYnVpbGQuCgpUZXN0ZWQgb24g
Q29ydGV4LUE1NSAoc3RtbWFjL2R3bWFjNCwga2VybmVsIDYuNi42MCkgd2l0aCBBRl9YRFAKemVy
by1jb3B5IGFuZCBJUHY2IGFjdGl2ZSDigJQgbm8gcGFuaWNzIG9ic2VydmVkIGFjcm9zcyByZXBl
YXRlZApYRFAgYXR0YWNoL2RldGFjaCBhbmQgWFNLIHBvb2wgc2V0dXAvdGVhcmRvd24gY3ljbGVz
LgoKRml4ZXM6IDEzMmMzMmVlNWJjMCAoIm5ldDogc3RtbWFjOiBBZGQgVFggdmlhIFhEUCB6ZXJv
LWNvcHkgc29ja2V0IikKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEZhbmdtZWllciA8Y2FybG9zLmZh
bmdtZWllckBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvc3RtbWFjX3hkcC5jIHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfeGRwLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfeGRwLmMKaW5kZXggZDdlNGRiNzIyNGIwLi5hNjYxMWFlZTY4
N2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y194ZHAuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
eGRwLmMKQEAgLTM0LDYgKzM0LDcgQEAgc3RhdGljIGludCBzdG1tYWNfeGRwX2VuYWJsZV9wb29s
KHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiwKIAluZWVkX3VwZGF0ZSA9IG5ldGlmX3J1bm5pbmco
cHJpdi0+ZGV2KSAmJiBzdG1tYWNfeGRwX2lzX2VuYWJsZWQocHJpdik7CiAKIAlpZiAobmVlZF91
cGRhdGUpIHsKKwkJbmV0aWZfdHhfZGlzYWJsZShwcml2LT5kZXYpOwogCQluYXBpX2Rpc2FibGUo
JmNoLT5yeF9uYXBpKTsKIAkJbmFwaV9kaXNhYmxlKCZjaC0+dHhfbmFwaSk7CiAJCXN0bW1hY19k
aXNhYmxlX3J4X3F1ZXVlKHByaXYsIHF1ZXVlKTsKQEAgLTQ2LDYgKzQ3LDcgQEAgc3RhdGljIGlu
dCBzdG1tYWNfeGRwX2VuYWJsZV9wb29sKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiwKIAkJc3Rt
bWFjX2VuYWJsZV9yeF9xdWV1ZShwcml2LCBxdWV1ZSk7CiAJCXN0bW1hY19lbmFibGVfdHhfcXVl
dWUocHJpdiwgcXVldWUpOwogCQluYXBpX2VuYWJsZSgmY2gtPnJ4dHhfbmFwaSk7CisJCW5ldGlm
X3R4X3dha2VfYWxsX3F1ZXVlcyhwcml2LT5kZXYpOwogCiAJCWVyciA9IHN0bW1hY194c2tfd2Fr
ZXVwKHByaXYtPmRldiwgcXVldWUsIFhEUF9XQUtFVVBfUlgpOwogCQlpZiAoZXJyKQpAQCAtNzIs
NiArNzQsNyBAQCBzdGF0aWMgaW50IHN0bW1hY194ZHBfZGlzYWJsZV9wb29sKHN0cnVjdCBzdG1t
YWNfcHJpdiAqcHJpdiwgdTE2IHF1ZXVlKQogCW5lZWRfdXBkYXRlID0gbmV0aWZfcnVubmluZyhw
cml2LT5kZXYpICYmIHN0bW1hY194ZHBfaXNfZW5hYmxlZChwcml2KTsKIAogCWlmIChuZWVkX3Vw
ZGF0ZSkgeworCQluZXRpZl90eF9kaXNhYmxlKHByaXYtPmRldik7CiAJCW5hcGlfZGlzYWJsZSgm
Y2gtPnJ4dHhfbmFwaSk7CiAJCXN0bW1hY19kaXNhYmxlX3J4X3F1ZXVlKHByaXYsIHF1ZXVlKTsK
IAkJc3RtbWFjX2Rpc2FibGVfdHhfcXVldWUocHJpdiwgcXVldWUpOwpAQCAtODcsNiArOTAsNyBA
QCBzdGF0aWMgaW50IHN0bW1hY194ZHBfZGlzYWJsZV9wb29sKHN0cnVjdCBzdG1tYWNfcHJpdiAq
cHJpdiwgdTE2IHF1ZXVlKQogCQlzdG1tYWNfZW5hYmxlX3R4X3F1ZXVlKHByaXYsIHF1ZXVlKTsK
IAkJbmFwaV9lbmFibGUoJmNoLT5yeF9uYXBpKTsKIAkJbmFwaV9lbmFibGUoJmNoLT50eF9uYXBp
KTsKKwkJbmV0aWZfdHhfd2FrZV9hbGxfcXVldWVzKHByaXYtPmRldik7CiAJfQogCiAJcmV0dXJu
IDA7CkBAIC0xMjEsOCArMTI1LDEwIEBAIGludCBzdG1tYWNfeGRwX3NldF9wcm9nKHN0cnVjdCBz
dG1tYWNfcHJpdiAqcHJpdiwgc3RydWN0IGJwZl9wcm9nICpwcm9nLAogCQl4ZHBfZmVhdHVyZXNf
Y2xlYXJfcmVkaXJlY3RfdGFyZ2V0KGRldik7CiAKIAluZWVkX3VwZGF0ZSA9ICEhcHJpdi0+eGRw
X3Byb2cgIT0gISFwcm9nOwotCWlmIChpZl9ydW5uaW5nICYmIG5lZWRfdXBkYXRlKQorCWlmIChp
Zl9ydW5uaW5nICYmIG5lZWRfdXBkYXRlKSB7CisJCW5ldGlmX3R4X2Rpc2FibGUoZGV2KTsKIAkJ
c3RtbWFjX3hkcF9yZWxlYXNlKGRldik7CisJfQogCiAJb2xkX3Byb2cgPSB4Y2hnKCZwcml2LT54
ZHBfcHJvZywgcHJvZyk7CiAJaWYgKG9sZF9wcm9nKQpAQCAtMTMxLDggKzEzNywxMCBAQCBpbnQg
c3RtbWFjX3hkcF9zZXRfcHJvZyhzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIHN0cnVjdCBicGZf
cHJvZyAqcHJvZywKIAkvKiBEaXNhYmxlIFJYIFNQSCBmb3IgWERQIG9wZXJhdGlvbiAqLwogCXBy
aXYtPnNwaF9hY3RpdmUgPSBwcml2LT5zcGhfY2FwYWJsZSAmJiAhc3RtbWFjX3hkcF9pc19lbmFi
bGVkKHByaXYpOwogCi0JaWYgKGlmX3J1bm5pbmcgJiYgbmVlZF91cGRhdGUpCisJaWYgKGlmX3J1
bm5pbmcgJiYgbmVlZF91cGRhdGUpIHsKIAkJc3RtbWFjX3hkcF9vcGVuKGRldik7CisJCW5ldGlm
X3R4X3dha2VfYWxsX3F1ZXVlcyhkZXYpOworCX0KIAogCWlmIChwcm9nKQogCQl4ZHBfZmVhdHVy
ZXNfc2V0X3JlZGlyZWN0X3RhcmdldChkZXYsIGZhbHNlKTsKCi0tLQpiYXNlLWNvbW1pdDogNGFh
Y2Y1MDllNTM3YTcxMWZhNzFiY2E5ZjIzNGU1ZWI2OTY4ODUwZQpjaGFuZ2UtaWQ6IDIwMjYwNjA0
LW1haW4tZjY5Zjk1NjRhNzRiCgpCZXN0IHJlZ2FyZHMsCi0tICAKQ2FybG9zIEZhbmdtZWllciA8
Y2FybG9zLmZhbmdtZWllckBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
