Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TK5NGU8j/Wn6YAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 01:42:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F02164F02FC
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 01:42:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEA27C8F289;
	Thu,  7 May 2026 23:42:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC8C9C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 23:42:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6EDC644282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 23:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519D7C2BCFA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778197324;
 bh=p7Rx6qNuAwgaIK8zmFad1PXiQo0SfDFYMCJz06kHD8g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XVSXDHrpJKD3xum7FnwZCCrA8iQEYbbX5GpPhqtER+Kb6ORUOY3o6PbYdaH27ErrQ
 kOT8v1aEKkqxk3pXWvcFlkpl9WqFtXYrCXYyzwY9QlBKenIv8N4ArqaqEbDr34fGlc
 v6s6uH/QYfdQQkmL6JKXVMxYqW1O2LOnJAsCod7JH6RB4mWoJSrBAIcwEzGXRaVPa6
 9V2lo8OCSID8OvbS0r0xvh7WvOtEv0WIpowa09YfkGNLYVEfEfbosRNN2LybFa7EfU
 UsV+GtnDWNlb2e/HbImt4blT9TVNkcaoufYLk3uCSmoQJLcp/3Fwxc2xjxD0jGNocb
 Tq1eNGpBaQ4ZA==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-67cd93d8affso1655077a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 16:42:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9pJFXtaA9ZAqj3sLHJ9+JTK4s0hpKm7PkyRr4AQcrEGcpTBUSAh4QscS6HATiMvCoHIL3STIl0JRHDgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6Yv/A8ykxgzjh9DxutMqhgW7/ptL9fmOuj4Xz40OZ6gxhEreR
 Mwapuhfnlljw08rrooMLkgjq+Fxb9L6SUnFXbq+oD/2g8zcTY9xAQUrEztETFVoqAiI2hxf/fV5
 K1/orSTjkLcwyJo9/7WXVEAOY63xNmQ==
X-Received: by 2002:aa7:da02:0:b0:66e:e024:1a08 with SMTP id
 4fb4d7f45d1cf-67d646b082bmr4114635a12.24.1778197322778; Thu, 07 May 2026
 16:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
In-Reply-To: <20260501155421.3329862-9-elder@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 18:41:49 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GY5O-ygTHDOA8pVBDi_aKcmcJ0yt-3Rv4a4=Ygk66uQ@mail.gmail.com>
X-Gm-Features: AVHnY4JOM9jN3mcHfPknCHd75ZrjDOMLe5cKzgxlMhp-0Ek9NIaM4mPgQRK3hWI
Message-ID: <CAL_Jsq+GY5O-ygTHDOA8pVBDi_aKcmcJ0yt-3Rv4a4=Ygk66uQ@mail.gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 08/12] dt-bindings: net: toshiba,
 tc965x-dwmac: add TC956x Ethernet bridge
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
X-Rspamd-Queue-Id: F02164F02FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:
 davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,riscstar.com:email,mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,devicetree.org:url]
X-Rspamd-Action: no action

T24gRnJpLCBNYXkgMSwgMjAyNiBhdCAxMDo1NeKAr0FNIEFsZXggRWxkZXIgPGVsZGVyQHJpc2Nz
dGFyLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbEByaXNjc3Rh
ci5jb20+Cj4KPiBBZGQgZGV2aWNldHJlZSBiaW5kaW5ncyBmb3IgdGhlIFRvc2hpYmEgVEM5NTZ4
IGZhbWlseSBvZiBFdGhlcm5ldC1BVkIvVFNOCj4gYnJpZGdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsQHJpc2NzdGFyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9uZXQv
dG9zaGliYSx0Yzk1NngtZHdtYWMueWFtbCAgICB8IDExMSArKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDExMSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3Rvc2hpYmEsdGM5NTZ4LWR3bWFj
LnlhbWwKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L3Rvc2hpYmEsdGM5NTZ4LWR3bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L3Rvc2hpYmEsdGM5NTZ4LWR3bWFjLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmQ5NWQyMmEzNzYxZGEKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC90b3NoaWJhLHRj
OTU2eC1kd21hYy55YW1sCj4gQEAgLTAsMCArMSwxMTEgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICst
LS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQvdG9zaGliYSx0Yzk1
NngtZHdtYWMueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogVG9zaGliYSBUQzk1NnggRXRoZXJuZXQtQVZC
L1RTTiBDb250cm9sbGVyCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEFsZXggRWxkZXIgPGVs
ZGVyQHJpc2NzdGFyLmNvbT4KPiArICAtIERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsQHJpc2NzdGFy
LmNvbT4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4gKyAgVGhpcyBub2RlIHByb3ZpZGVzIHByb3Bl
cnRpZXMgZm9yIGNvbmZpZ3VyaW5nIHRoZSBFdGhlcm5ldCBQQ0kgZnVuY3Rpb25zCj4gKyAgdGhh
dCBhcmUgYXR0YWNoZWQgdG8gdGhlIGludGVybmFsIGRvd25zdHJlYW0gcG9ydCBvZiB0aGUgVEM5
NTZ4J3MgUENJZQo+ICsgIHN3aXRjaC4KPiArCj4gKyAgVEM5NTZ4IGFyZSBhIGZhbWlseSBvZiBF
dGhlcm5ldC1BVkIvVFNOIGJyaWRnZSBjaGlwcyB0aGF0IGNvbWJpbmUgYSBQQ0llCj4gKyAgc3dp
dGNoIHRvZ2V0aGVyIHdpdGggYSBudW1iZXIgb2YgRXRoZXJuZXQgY29udHJvbGxlcnMuIFRoZXNl
IGJpbmRpbmdzCj4gKyAgY292ZXIgb25seSB0aGUgRXRoZXJuZXQgZnVuY3Rpb25zIG9mIHRoZXNl
IGRldmljZXMuCj4gKwo+ICthbGxPZjoKPiArICAtICRyZWY6IC9zY2hlbWFzL3BjaS9wY2ktYnVz
LWNvbW1vbi55YW1sIwo+ICsgIC0gJHJlZjogL3NjaGVtYXMvcGNpL3BjaS1kZXZpY2UueWFtbCMK
PiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK3Byb3BlcnRpZXM6Cj4g
KyAgY29tcGF0aWJsZToKPiArICAgIGVudW06Cj4gKyAgICAgIC0gcGNpMTE3OSwwMjIwICMgVG9z
aGliYSBUQzk1NjQgKGEuay5hLiBRdWFsY29tbSBRUFM2MTUpCj4gKwo+ICsgICIjZ3Bpby1jZWxs
cyI6Cj4gKyAgICBjb25zdDogMgo+ICsKPiArICBncGlvLWNvbnRyb2xsZXI6IHRydWUKPiArCj4g
KyAgIyBXZSBjYW4ndCBhbGxPZiByZWZlcmVuY2UgRXRoZXJuZXQtY29udHJvbGxlci55YW1sIGJl
Y2F1c2Ugd2UgZW5kIHVwIHdpdGgKPiArICAjIGNvbnRyYWRpY3RvcnkgJG5vZGVuYW1lIHJ1bGVz
IChgZXRoZXJuZXRAYCB2ZXJzdXMgYHBjaUBgKS4gSGFwcGlseSBvbmx5IGEKPiArICAjIHNtYWxs
IG51bWJlciBvZiB0aGUgcHJvcGVydGllcyBhcmUgdXNlZnVsIG9uIFRDOTU2eCBzbyB3ZSBjYW4g
anVzdCByZWZlcmVuY2UKPiArICAjIHdoYXQgd2UgbmVlZC4KClRoYXQgd291bGQgYmUgZHVlIHRv
IHRoZSBlcnJvciBzYXNoaWtvIHBvaW50ZWQgb3V0LiAncGNpJyBpcyBmb3IgUENJCmJyaWRnZXMg
KGhvc3Qgb3IgUENJLVBDSSkuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
