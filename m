Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id acMyDCL03mnMMwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 04:12:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A98623FFB1E
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 04:12:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E390BC58D7A;
	Wed, 15 Apr 2026 02:12:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 690D1C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 02:12:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso75526195e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 19:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776219167; cv=none;
 d=google.com; s=arc-20240605;
 b=awutCQy6RYpg9m9SepQ48hzcTQEDm7IKUPe+jktzXL5OMrOFVPlcmEwI5xnzG0fwOF
 9f1tNkoyIv7FR8gb4T8VVy7oOteJu6t3tTMWSAMnou6J8MCWurUR0SUa1qHAvpDFA8yD
 H/TVktLX5vnSPU4TPjcH7ofRKDvQx5SbquGFidtZA73So/uU3hO5S9tis+MuXicoNwcE
 1PbSM1eCsWyo/3inpvvbMFpwOkt/9hPuHuw3XdDlefbJwuWI22ZEM5z44MMuSaCxZAqE
 jA9DYRSLrKlCKbtvBngQCQUWFSMjnYDH41fzs0o3dISIItlGiCsDDZAt18BsylCboOyd
 8JJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aBV/+MFplyMX182F7OgLwYJLUvM+93jxAF1jhxn3A/M=;
 fh=Hm1bTAqK9dmJZ9trh8/BVL/yu5cpKO0341E/u59L86o=;
 b=gxnKGivrC4O3YNmIBABatYE7xkXJVCa+duZ3i42t0Tyxh+jvwHGWYro6gl9oGqWXAW
 uvwqimS6gmPvTkTacjCiewMa6l1VXeL12eKReu/nL9yrrt/yl3evzK0dnZoCj9DQAhWh
 1KpXa7TNhQwDWY/HxxWt824D4IMU8UYVGoyCIJvh+1wu0A/sPrQJ7x1s5bf4zVP5E8yP
 lMsgAwqbLV3bGpKcNIFjrNxsCc1POXZtWX1xAVdZjtXXnc1eR/G/pIU/NP1E2l7buZxC
 KqbUOHp9VHLPO+0XVzsjS9CNHZFbv7cOZ+zAii/rFr2KtivNBI4jZ9vZqUuz981ApbQi
 ylxA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776219167; x=1776823967;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aBV/+MFplyMX182F7OgLwYJLUvM+93jxAF1jhxn3A/M=;
 b=hbcLWnkfPlLPWlmGOrCN6I/8jHBd3Q4CVB2kcBw+mIGCMhQJIZwGHBOP9h2PthsApN
 XjoepZ7hyMPUNTi+RVgRmTix47UO+NIdRY3tVuLx43pXb9kI7mqssp228vxij58ZELfX
 vk3brhlAPkgD4Ng2qsVhi6MMn5vMNgdiDc5IFQYbf3jOv5SSU2F1v7ss9DUNs3xyd7Um
 GQuusXzghnrMAd/C6Z+sG2FSOULujefD4Vo88xAuSb1X7WPJgnqgx5HaC2U8F7QzQ2w3
 pLd3+Dbl/mxbcP63P8gZPJfh8hChWdwB0xERvuU41KldRQDU+wCKcxlnzq5kiBkN+lVh
 XtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776219167; x=1776823967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aBV/+MFplyMX182F7OgLwYJLUvM+93jxAF1jhxn3A/M=;
 b=FevfR+WHXmkqec0HurA6DKrffm2MEyguzlvsHDMvM5JyoxD70rGDiiWWWE224BTb1V
 zoFVSPgbM+dVgRh72CDvspEvslTJ1ZyWICEzqGupIfAhnQ6RpZihwbbgwRoxQssL92ZO
 in8hURhPq5ZWh+wd8HiuwNkaqcQ+hUMQhl38+IhpGTAV0d83awBRQmQ1eVxqtyOvaPOR
 1X8ZgRp0o5MtDXhKOmWBY6iOlxISpnCmdAFDLsFaQbBKm5M+WVgm7fKrZKxhzMrsqt8M
 mL302ArhV0PyYr22m7MdF8pUlMV8HzZrieNB0Iwdb65oeSAJo1tfp/Pc99aYQ3YzVX5N
 YT5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Q+TFv60pZlUKU1Cy7TWavOzCfcvdIFZHHXzmw6g1z9assrndaMRf73QB3cqhEb6xmMijoGk8JdpCgBg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0zTxAt55fW8ktdm9z2rNvYm2eeHBSdbcaRj+NfZ2AhgnTMnou
 UVk/ke+E/sOMDeqfUUiLK/099YXGQFhl4lWkToUczEL39kAwaKTENzJynbHb/ckKASnzZy0KsII
 UBxT2SNf6c8jPqo/+tBAOewOyKFn5RB4=
X-Gm-Gg: AeBDievAYtTB1s06gAy5L6bZJGQDVidBYYC5WFm02E4HFx8mSXzwR+lETlwL5z5l5Wo
 LN55oMS0W9WJCU+Bw4mBBZJ3UsBadAB2mJU6BewAafa3HjeQJI3KbyJmh0ZrGKuIT84g8l7fHSu
 zPe0hqTJa0JGuJe5DN1KALqTotpoLi+xlTrHN92MmdQBCvhFZXz0vrBBewdd8uD0Op/mvvUOWkr
 IYScwTWZhHRYUdPB5WbzEv6GHe/u2KkF6tI6T9cyA1GP8NTywRfXl/z6BxM/XOQYNWaxKZuTw9p
 YtUAU5XLJbA6DMcaBp7m5H2A9+Nd
X-Received: by 2002:a05:600c:4f83:b0:488:7ff5:2c67 with SMTP id
 5b1f17b1804b1-488d67f0aa2mr242704755e9.12.1776219166427; Tue, 14 Apr 2026
 19:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
 <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
In-Reply-To: <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Tue, 14 Apr 2026 19:12:34 -0700
X-Gm-Features: AQROBzCDcuqEllTQUrqo3wn50XlYGqYnBRK7Hkwk8UIZegBM5SM6IflWL3J01U4
Message-ID: <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Network Development Mailing List <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: enable RPS and RBU
	interrupts
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: A98623FFB1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNjoxOeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPa2F5LCBqdXN0IGEgcXVpY2sgbm90ZSB0
byBzYXkgdGhhdCBudmlkaWEncyA1LjEwLjIxNi10ZWdyYSBrZXJuZWwKPiBzdXJ2aXZlcyBpcGVy
ZjMgLWMgLVIgdG8gdGhlIGlteDYuCgpIaSBSdXNzZWxsLAoKQXcsIHlvdSBiZWF0IG1lIHRvIGl0
ISBJIHdhcyBhYm91dCB0byByZXBvcnQgdGhhdCA1LjEwLjEwNC10ZWdyYSBpcwp1bmFmZmVjdGVk
LiBBbmQgbXkgaXBlcmYzIHNlcnZlciBpcyBhIG11bHRpLUdiRSBhbWQ2NCBtYWNoaW5lLgoKPiBE
dW1waW5nIHRoZSByZWdpc3RlcnMgYW5kIGNvbXBhcmluZywgYW5kIHRoZW4gZm9yY2luZyB0aGUg
UlFTIGFuZCBUUVMKPiB2YWx1ZXMgdG8gMHgyMyAoKzEgPSAzNiwgKjI1NiA9IDkyMTYgYnl0ZXMp
IGFuZCAweDhmICgrMSA9IDE0NCwKPiAqMjU2ID0gMzY4NjQgeXRlcykgcmVzcGVjdGl2ZWx5IHNl
ZW1zIHRvIHNvbHZlIHRoZSBwcm9ibGVtLiBVbmRlcgo+IG5ldC1uZXh0LCB0aGVzZSBib3RoIGVu
ZCB1cCBiZWluZyAweGZmICgrMSA9IDI1NiwgKjI1NiA9IDY1NTM2IGJ5dGVzLikKPiBTdXNwaWNp
b3VzbHksIDM2ICogNCA9IDE0NCwgYW5kIEkgYWxzbyBzZWUgdGhhdCB0aGlzIGtlcm5lbCBwcm9n
cmFtcwo+IGFsbCBmb3VyIG9mIHRoZSBNVEwgcmVjZWl2ZSBvcGVyYXRpb24gbW9kZSByZWdpc3Rl
cnMsIGJ1dCBvbmx5IHRoZQo+IGZpcnN0IE1UTCB0cmFuc21pdCBvcGVyYXRpb24gbW9kZSByZWdp
c3Rlci4gSG93ZXZlciwgRE1BIGNoYW5uZWxzIDEtMwo+IGFyZW4ndCBpbml0aWFsaXNlZC4KCldv
dywgZ3JlYXQhIEkgd29uZGVyIGlmIHRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIE1UTCBGSUZPcyBh
cmUgc21hbGxlcgp0aGFuIHRoYXQsIHNvIHdoZW4gdGhlIERNQSBzdWZmZXJzIGEgbW9tZW50YXJ5
IGhpY2N1cCwgdGhlIEZJRk9zIGFyZQphbGxvd2VkIHRvIG92ZXJmbG93LCBwdXR0aW5nIHRoZSBo
YXJkd2FyZSBpbiBhIGJhZCBzdGF0ZS4KClRob3VnaCBJIHN1c3BlY3QgdGhpcyBpcyBvbmx5IGhh
bGYgb2YgdGhlIHByb2JsZW06IGRvIHlvdSBzdGlsbCBzZWUKUkJVcz8gRXZlcnl0aGluZyB5b3Un
dmUgc2hhcmVkIHNvIGZhciBzdWdnZXN0cyB0aGUgRE1BIGZhaWx1cmVzIGFyZQpfbm90XyBiZWNh
dXNlIHRoZSByeCByaW5nIGlzIGRyeWluZyB1cC4gTXkgZ3V0J3MgdGVsbGluZyBtZSB0aGUgRE1B
CnVuaXQgaXMgZW5jb3VudGVyaW5nIGFuIEFYSSBlcnJvciwgdHJpZ2dlcmluZyBSQlUgcGx1cyBz
b21lIGtpbmQgb2YKcmVjb3ZlcnkgYmVoYXZpb3IsIGFuZCB0aGUgcmVjb3ZlcnkgdGFrZXMgdGhl
IERNQSBvZmZsaW5lIGxvbmcgZW5vdWdoCmZvciB0aGUgRklGTyB0byBvdmVyZmxvdyAod2l0aG91
dCB0cmlnZ2VyaW5nIFJQUyBiZWNhdXNlIHRoZSBSUVMKdGhyZXNob2xkIGlzIHVucmVhY2hhYmxl
KS4KCkl0IHNlZW1zIHRoYXQgdGhlIHByb2JsZW0gaGFwcGVucyBsZXNzIGZyZXF1ZW50bHkgb24g
bXkgdGVzdCBzZXR1cAp3aGVuIEkgYm9vdCB3aXRoIGlvbW11LnBhc3N0aHJvdWdoPTEgYnV0IHRo
YXQgY291bGQgYmUgbXkgaW1hZ2luYXRpb24uCkJ1dCBpZiB0aGUgaGFyZHdhcmUgcmVtYWlucyBz
dGFibGUgd2l0aCBSUVMgYW5kIFRRUyBzZXQgY29ycmVjdGx5LCBJCmRvbid0IGZlZWwgYW4gdXJn
ZW50IG5lZWQgdG8gZGlnIGRlZXBlci4gOikKCj4gTG9va2luZyBiYWNrIGF0IDUuMTAsIEkgZG9u
J3Qgc2VlIGFueSBjb2RlIHRoYXQgd291bGQgYWNjb3VudCBmb3IgdGhlc2UKPiB2YWx1ZXMgYmVp
bmcgcHJvZ3JhbW1lZCBmb3IgVFFTIGFuZCBSUVMsIGl0IGxvb2tzIGxpa2UgdGhlIGNhbGN1bGF0
aW9ucwo+IGFyZSBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgd2UgaGF2ZSB0b2RheS4KCk5vdGUgdGhh
dCBOdmlkaWEgaGF2ZSB0aGVpciBvd24gIm52ZXRoZXJuZXQiIGRyaXZlciBmb3IgdGhlaXIgdmVu
ZG9yCmtlcm5lbCwgd2hpY2ggYXBwZWFycyB0byBwaWNrIHRoZSBGSUZPIHNpemVzIGZyb20gaGFy
ZGNvZGVkIHRhYmxlcyBpbgppdHMgZXFvc19jb25maWd1cmVfbXRsX3F1ZXVlKCkgWzFdIGZ1bmN0
aW9uLgoKQ2hlZXJzLApTYW0KClsxXSBodHRwczovL2dpdGh1Yi5jb20vcHJvc2tpL252ZXRoZXJu
ZXQvYmxvYi9tYWluL252ZXRoZXJuZXRybS9vc2kvY29yZS9lcW9zX2NvcmUuYyNMMjYzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
