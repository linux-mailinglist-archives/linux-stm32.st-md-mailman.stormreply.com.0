Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RtUaA0VaI2qjqgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 06 Jun 2026 01:22:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA864BCA9
	for <lists+linux-stm32@lfdr.de>; Sat, 06 Jun 2026 01:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=XX3yDoI1;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59400C01FB6;
	Fri,  5 Jun 2026 23:22:44 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 885FBCFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 23:22:42 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7e71b2d527dso212686a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jun 2026 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780701761; x=1781306561;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2k7U07qtwbFmbaheJUqoAwqTh+vQ4LcZsVmb0igPq1c=;
 b=XX3yDoI1Z9Dw9jPJqQNzlm9d2f8/HOi2B5EbJdzFHBeqBilt5AmbadNxogVdCvTQ36
 00IgVm8L1v6SLs58zA5aFMJyGpGGrPzc1sTmLoqz5ZwX2CXxsBqc1wTqXflMjhL7+pIZ
 KIx7m8uyUzsmZB4XqIv+/LyegvW3YCMRrWGcPq3yhkyBdwV3P2vkobR4LKOOfcXv4bup
 wdF+vyE7KADN9BL3Z1FPhGpVsT3MvE5P/V0D3H4FYIC8DraAeeFpoYV694sKo2JDQxhE
 kTph0bgr9olLAfOmbbkBCOOO5QKfWqsGKB1HBER1ERSDmEbR7fyCrCVs/VyIWcc3XwAO
 qe+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780701761; x=1781306561;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2k7U07qtwbFmbaheJUqoAwqTh+vQ4LcZsVmb0igPq1c=;
 b=HqGgrXJYzPC9eX/jIO++WOsPH5pdoBZacBvEQjnzsZcm60PdcIOrL5KsFIcIc4u1Di
 mfSisvxhl5UUBgLrOE/LV7TCgPLpsgqrpmBZgSEvIIDfySCbzWqyQDwIdNQOeQBHVNK8
 ZUbsuA4vhnAMPC1L32Q8YlvMMtwzt6TETM+kKIV0aYp0QsCGzSoEZa4O9LsOj/rezObr
 nah6C4VppPkzag5wXMJiooojI+USxiPTKJaVtikTXJ+bfcOsHqoO1V9a9Glp52z1+q9r
 Wo+ILalHyMyklFEr6LDKKmn3UXiUhkO4wTX518MioFphp0FUfzFX96cMDbLMaBslAKSq
 i/bg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/0y0EtLi4BgQTJkrVfFDJIPP0OD0g910NgJc8yaRW/ECQ8pN24m3VoI8oOnX0q4nuZ/MgOmsnqBsvq9w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzsg98CP+JnlwxQdCp1SbSPeESwM7mSeN0S6NoZFI9SSp3yOkPo
 kAy2ew15SHqDD7dyPsqoAgrMvR0oAh0QNHUsmwUwVghb+W+eBX7qQPHM
X-Gm-Gg: Acq92OH/Hw7c/SP/7WFeJTA9WEz/FRGk+DBWCPacSpnVF4ihcyt36YOHCB63A0CD/OG
 SnY6P9IryHynaWpxmwC/xfDzasBkybJY5LQOKAUfzhTCqydqu1wDMiFi0lhbxtFZOT4NuJUPxGG
 Q2wyOgc8OSL8RlGGEuqyv/57wR/GNyW/5nW77UJ1BiQ4/7MGFPjCc3kVLUokh8q+Kh3CVZqDy9k
 0cf61BYEhazT9ILQCE/nOxDE19vm2epOMm1nKm0m1fNjZa4ZoV/chaVN1fSdC4fTeyaZAQX2+uz
 92RyoJxomlXqA//6Z4Y74qIYnTF1ctoahDJHMGMjzHU4e+W05lay9J1EvUM5eraRx0HLzVD6Eg5
 +6ihsIof/9yQWaH84zHTtWL7RAT+/P4FFBcothQNuKRvlbTaQ7vtIIYxXB1l2EMbGWDT9oX4axg
 z0M+E1x/sMzmRZcZABJKunNios3+rTNMnTpdsSdRmOm/RvpZNEaN4SHLVC898tIf3/naCFD9G9K
 vY2cM6sOsLuY6M99CEfz7T7Tvew
X-Received: by 2002:a05:6830:82bb:b0:7de:4fc6:a588 with SMTP id
 46e09a7af769-7e70ca7b3c2mr3388171a34.23.1780701761185; 
 Fri, 05 Jun 2026 16:22:41 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4d::])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6e745fea5sm6605643a34.5.2026.06.05.16.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 16:22:40 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 05 Jun 2026 16:22:39 -0700
Message-Id: <DJ1I3B2TSXSL.AV4PS9YH714@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>
X-Mailer: aerc
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 4/8] bpf,
 x86: refactor BPF_ST management in do_jit
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
X-Spamd-Result: default: False [4.00 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98FA864BCA9

T24gVGh1IEp1biA0LCAyMDI2IGF0IDE6MjIgUE0gUERULCBBbGV4aXMgTG90aG9yw6kgKGVCUEYg
Rm91bmRhdGlvbikgd3JvdGU6Cj4gSW4gb3JkZXIgdG8gcHJlcGFyZSBmb3IgS0FTQU4gY2hlY2tz
IGluc2VydGlvbiBiZWZvcmUgZXZlcnkKPiBtZW1vcnktcmVsYXRlZCBsb2FkIG9yIHN0b3JlLCBn
cm91cCBhbGwgQlBGX1NUIGluc3RydWN0aW9ucyB0aGF0IGluZGVlZAo+IGFjY2VzcyBtZW1vcnkg
aW4gYSBzaW5nbGUgYmxvY2sgb2YgZmFsbC10aHJvdWdoIGNhc2VzIHRvIGFsbG93Cj4gaW5zdHJ1
bWVudGluZyB0aG9zZSBpbiBvbmUgY2FsbCwgcmF0aGVyIHRoYW4gaGF2aW5nIHRvIGluc3RydW1l
bnQgYWxsCj4gY2FzZXMgaW5kaXZpZHVhbGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExv
dGhvcsOpIChlQlBGIEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiAt
LS0KPiAgYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIHwgNTMgKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspLCAyMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9uZXQvYnBm
X2ppdF9jb21wLmMgYi9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKPiBpbmRleCAwOTgxNzkx
MDE0ZWIuLjk0M2EwZjMxNWNmMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9j
b21wLmMKPiArKysgYi9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKPiBAQCAtMjMwMCw0MSAr
MjMwMCw1MCBAQCBzdGF0aWMgaW50IGRvX2ppdChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52
LCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9wcm9nLCBpbnQgKgo+ICAJCQlFTUlUX0xGRU5DRSgpOwo+
ICAJCQlicmVhazsKPiAgCj4gLQkJCS8qIFNUOiAqKHU4KikoZHN0X3JlZyArIG9mZikgPSBpbW0g
Ki8KPiAgCQljYXNlIEJQRl9TVCB8IEJQRl9NRU0gfCBCUEZfQjoKPiAtCQkJaWYgKGlzX2VyZWco
ZHN0X3JlZykpCj4gLQkJCQlFTUlUMigweDQxLCAweEM2KTsKPiAtCQkJZWxzZQo+IC0JCQkJRU1J
VDEoMHhDNik7Cj4gLQkJCWdvdG8gc3Q7Cj4gIAkJY2FzZSBCUEZfU1QgfCBCUEZfTUVNIHwgQlBG
X0g6Cj4gLQkJCWlmIChpc19lcmVnKGRzdF9yZWcpKQo+IC0JCQkJRU1JVDMoMHg2NiwgMHg0MSwg
MHhDNyk7Cj4gLQkJCWVsc2UKPiAtCQkJCUVNSVQyKDB4NjYsIDB4QzcpOwo+IC0JCQlnb3RvIHN0
Owo+ICAJCWNhc2UgQlBGX1NUIHwgQlBGX01FTSB8IEJQRl9XOgo+IC0JCQlpZiAoaXNfZXJlZyhk
c3RfcmVnKSkKPiAtCQkJCUVNSVQyKDB4NDEsIDB4QzcpOwo+IC0JCQllbHNlCj4gLQkJCQlFTUlU
MSgweEM3KTsKPiAtCQkJZ290byBzdDsKPiAgCQljYXNlIEJQRl9TVCB8IEJQRl9NRU0gfCBCUEZf
RFc6Cj4gLQkJCWlmIChkc3RfcmVnID09IEJQRl9SRUdfUEFSQU1TICYmIGluc24tPm9mZiA9PSAt
OCkgewo+IC0JCQkJLyogQXJnIDY6IHN0b3JlIGltbWVkaWF0ZSBpbiByOSByZWdpc3RlciAqLwo+
IC0JCQkJZW1pdF9tb3ZfaW1tNjQoJnByb2csIFg4Nl9SRUdfUjksIGltbTMyID4+IDMxLCAodTMy
KWltbTMyKTsKPiArCQkJc3dpdGNoIChCUEZfU0laRShpbnNuLT5jb2RlKSkgewo+ICsJCQljYXNl
IEJQRl9COgo+ICsJCQkJaWYgKGlzX2VyZWcoZHN0X3JlZykpCj4gKwkJCQkJRU1JVDIoMHg0MSwg
MHhDNik7Cj4gKwkJCQllbHNlCj4gKwkJCQkJRU1JVDEoMHhDNik7Cj4gKwkJCQlicmVhazsKPiAr
CQkJY2FzZSBCUEZfSDoKPiArCQkJCWlmIChpc19lcmVnKGRzdF9yZWcpKQo+ICsJCQkJCUVNSVQz
KDB4NjYsIDB4NDEsIDB4QzcpOwo+ICsJCQkJZWxzZQo+ICsJCQkJCUVNSVQyKDB4NjYsIDB4Qzcp
Owo+ICsJCQkJYnJlYWs7Cj4gKwkJCWNhc2UgQlBGX1c6Cj4gKwkJCQlpZiAoaXNfZXJlZyhkc3Rf
cmVnKSkKPiArCQkJCQlFTUlUMigweDQxLCAweEM3KTsKPiArCQkJCWVsc2UKPiArCQkJCQlFTUlU
MSgweEM3KTsKPiArCQkJCWJyZWFrOwo+ICsJCQljYXNlIEJQRl9EVzoKPiArCQkJCWlmIChkc3Rf
cmVnID09IEJQRl9SRUdfUEFSQU1TICYmCj4gKwkJCQkgICAgaW5zbi0+b2ZmID09IC04KSB7Cj4g
KwkJCQkJLyogQXJnIDY6IHN0b3JlIGltbWVkaWF0ZSBpbiByOSByZWdpc3RlciAqLwo+ICsJCQkJ
CWVtaXRfbW92X2ltbTY0KCZwcm9nLCBYODZfUkVHX1I5LAo+ICsJCQkJCQkgICAgICAgaW1tMzIg
Pj4gMzEsICh1MzIpaW1tMzIpOwo+ICsJCQkJCWJyZWFrOwo+ICsJCQkJfQo+ICsJCQkJRU1JVDIo
YWRkXzFtb2QoMHg0OCwgZHN0X3JlZyksIDB4QzcpOwoKbWF5YmUgaXQncyBhbiBvcHBvcnR1bml0
eSB0byBjb3ZlciB0aGlzIGludG8gc2VwYXJhdGUgaGVscGVyIGZ1bmN0aW9uPwpXaGVuIGluZGVu
dCByZWFjaGVzIDQgdGFicyBpdCdzIGFib3V0IHRpbWUuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
