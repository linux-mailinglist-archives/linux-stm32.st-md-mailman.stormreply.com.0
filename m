Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INjoFGfOsGkKnQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 03:07:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E625AA0D
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 03:07:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB11C8F26D;
	Wed, 11 Mar 2026 02:07:34 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6651EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 02:07:33 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5a1362c9a3cso5630112e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 19:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773194852; cv=none;
 d=google.com; s=arc-20240605;
 b=kFpi/GShYfo72PzWVI1VjXXpPhYpGBigoVt5A7CS1c296ZrCV1OBjcYcct380yKgeR
 JxiL4E+AzAj1mPqNbv5q2R7ItLmD4GCWdpgzUd3H4ylm0wze3gHAWphKCfY/bPAZroQE
 Wdux1yWV0NxlHd46sX9L/NeDK7GNggeOG810eUroy7i+hbvF/rzX2pDfSudSQ1zaWMmY
 3hjaDa38aiONVrc6HSXbTJ9l74tD6kVg47gPWIFc4ym09foSAo2oPFOJxuU/5neFluDz
 lRUA3EQloPhrS3Wf2vsR+3jjA+vCCzwqWMWKny4ByQMYz9xawrX/WWGwbcbJRxtNxC+d
 foVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
 fh=7t2Ac6IWDBkwvxsimkLZw3wLZdvvKUZKgev1Eljw4lE=;
 b=gtTykxUCpvQ8yi9G53BNNTJEtT3314iFW5JUEmEC1IQ4DXeSfA/SrsDDpMyFIee1nF
 VlNK7I9LL5h/ZROL4DvNoDu7van6mKbiKP4NTyaH4/futRuwwDLo7ttiNvQr+vHggvS+
 HuafuOTK93yAp5InbifwIFFVmZITLfRrjUMrx2L8ZZCwQtklfzNEpHRKlHIV+uYdldki
 RwJyBDX/wYxkcaM98v6okK6GKy+FbHspqo0IVsdWTu2aY4KNodJFXD81vhRtF3nG9DuD
 BYNr29j1nUTWUAx+hZHO5E4imUvAW0OecrmYk9Ro/TjQ03yE4rPpr1nwb15CzP4Dbyzz
 3sYQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1773194852; x=1773799652;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
 b=Vbb/hdzhiLP0733xmIEhxUCGHBUk9d2iFHr0JrqxOrpi8Py6zXHoCmGLa32waesgAa
 RTwOAumoZz3R25T5S95NwGDjZKbD8JONBMAQ0oswLbemnO+2bn08grgRZyBU6cSHH/Ke
 fW2LzV1g8hBO+OSrb2Bl8df9TMuueklbZOy/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773194852; x=1773799652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
 b=xFnc2JXiwF0kGv76avxI/KoRjf33jxVPsOsU7oVFmkfMhBbWWZ7ByaNnJR5QinYh8y
 eWApdBMhJcvrMiOfTSHO3/wTPt+GBSf9io2nfeVZVrNFbu/X03YT89R0TsghOGC4e+Pf
 tjw41CaXd/3GgPMDrndVkwth1C5K5zPPPDvnl1leeyHG3OiuZWCIKx0K9fJXAppXVeLF
 b39VY2w6Qst3rMI1JbcjXvHxMuzBucfL9YKD5UX/udvCDq4nquOd507lpXSO3wdY3LUn
 KSuDHGQVfz5qLAYYA36Nr9KsFuxVoizcZAwjywtiAHyAwdjbGNkbvfH2wjHmUdr32Dzr
 Oqyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqFWK5Ifj3iSISB8XzReMvKhejPX0hr7cQHWOs5YToMSVwFCTOT0MeVunGFibMIk9x0C4hzfNyxNTf4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXE7UnBKJIBW7+RHwf7wTXOmaCT6N5iAdgVCmAnhisxyMRp4Uv
 CRxN4jbgy/loPNTQq54JwtUqPiJKnTUqxzG62kTwYS1AcJEfX8+eS0fcL3OLkU+HjUtURowLnSH
 pVwf/cnLZvygdaXHJM4yG6Tmv1vageAkB+biP8EgX
X-Gm-Gg: ATEYQzxpDWBm30Qsn4veNU1ObTv+WvIgMmD+HPj9xunDIYt4pS/cnVtEltFs5lco10I
 l2Qs0Fz78HGdUCE1ZvNwyL24hU8qQOUdSLxml2hoLQ4NEwpMmSYoqsAxizQKhjHbGTfUWIWXetL
 LP3/jeA31HYrtlLkKJ2MDDiWpJaDBHi7th+SxQLXzo1m/Y5rUbiW+PEd//FUhFixlDUJ+m4amad
 WaVLER/MY4P1cb+uiR+i/dRpW/yS+Syr3aPX+Yf5svOt4/iY3VZ+ReNLYpofN+V0goIEx6W9PE/
 t8XDOxYLCg==
X-Received: by 2002:ac2:4427:0:b0:5a1:3134:9bac with SMTP id
 2adb3069b0e04-5a156cbd1bbmr169453e87.28.1773194852284; Tue, 10 Mar 2026
 19:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Mar 2026 11:07:21 +0900
X-Gm-Features: AaiRm5028PWt8n-JnveiRgn8oYMksdR_-_nk4JOkvxMfplWs-GDr7RRk-OxICyw
Message-ID: <CAGXv+5FQAVaJjqhv+Xq-ysOc4SHQn2mCNTgCAp8XocmWBWGGoA@mail.gmail.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 samba-technical@lists.samba.org, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@kernel.org>, ceph-devel@vger.kernel.org,
 linux-omap@vger.kernel.org, sched-ext@lists.linux.dev, cocci@inria.fr,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, linux-s390@vger.kernel.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over
	manual NULL check
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
X-Rspamd-Queue-Id: DF8E625AA0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:mturquette@baylibre.com,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:tglx@kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:lin
 ux-block@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:daniel.lezcano@kernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:sboyd@kernel.org,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wenst@chromium.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[58];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,avm.de:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgOTo1N+KAr1BNIFBoaWxpcHAgSGFobiA8cGhhaG4tb3Nz
QGF2bS5kZT4gd3JvdGU6Cj4KPiBQcmVmZXIgdXNpbmcgSVNfRVJSX09SX05VTEwoKSBvdmVyIHVz
aW5nIElTX0VSUigpIGFuZCBhIG1hbnVhbCBOVUxMCj4gY2hlY2suCj4KPiBTZW1hbnRpY2ggY2hh
bmdlOiBQcmV2aW91c2x5IHRoZSBjb2RlIG9ubHkgcHJpbnRlZCB0aGUgd2FybmluZyBvbiBlcnJv
ciwKPiBidXQgbm90IHdoZW4gdGhlIHBvaW50ZXIgd2FzIE5VTEwuIE5vdyB0aGUgd2FybmluZyBp
cyBwcmludGVkIGluIGJvdGgKPiBjYXNlcyEKPgo+IENoYW5nZSBmb3VuZCB3aXRoIGNvY2NpbmVs
bGUuCj4KPiBUbzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPgo+
IFRvOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4gVG86IERhbmllbCBMZXpjYW5v
IDxkYW5pZWwubGV6Y2Fub0BrZXJuZWwub3JnPgo+IFRvOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
a2VybmVsLm9yZz4KPiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBIYWhuIDxwaGFo
bi1vc3NAYXZtLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2Nsay9jbGsuYyAgICAgICAgICAgICAgIHwg
NCArKy0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcHhhLmMgfCAyICstCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY2xrL2Nsay5jIGIvZHJpdmVycy9jbGsvY2xrLmMKPiBpbmRleCA0NzA5M2Nk
YTlkZjMyMjIzYzExMjBjMzcxMDI2MTI5NjAyN2M0Y2QzLi4zNTE0NmUzODY5YTdkZDkzNzQxZDEw
YjcyMjNkNDQ4OGE5MjE2ZWQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay5jCj4gKysr
IGIvZHJpdmVycy9jbGsvY2xrLmMKPiBAQCAtNDU1OCw3ICs0NTU4LDcgQEAgdm9pZCBjbGtfdW5y
ZWdpc3RlcihzdHJ1Y3QgY2xrICpjbGspCj4gICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+
ICAgICAgICAgY29uc3Qgc3RydWN0IGNsa19vcHMgKm9wczsKPgo+IC0gICAgICAgaWYgKCFjbGsg
fHwgV0FSTl9PTl9PTkNFKElTX0VSUihjbGspKSkKPiArICAgICAgIGlmIChXQVJOX09OX09OQ0Uo
SVNfRVJSX09SX05VTEwoY2xrKSkpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICAgICAg
ICAgY2xrX2RlYnVnX3VucmVnaXN0ZXIoY2xrLT5jb3JlKTsKPiBAQCAtNDc0NCw3ICs0NzQ0LDcg
QEAgdm9pZCBfX2Nsa19wdXQoc3RydWN0IGNsayAqY2xrKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
bW9kdWxlICpvd25lcjsKPgo+IC0gICAgICAgaWYgKCFjbGsgfHwgV0FSTl9PTl9PTkNFKElTX0VS
UihjbGspKSkKPiArICAgICAgIGlmIChXQVJOX09OX09OQ0UoSVNfRVJSX09SX05VTEwoY2xrKSkp
CgpjbGtfZ2V0X29wdGlvbmFsKCkgcmV0dXJucyBOVUxMIGlmIHRoZSBjbGsgaXNuJ3QgcHJlc2Vu
dC4KCkRyaXZlcnMgd291bGQganVzdCBwYXNzIHRoaXMgdG8gY2xrX3B1dCgpLiBZb3VyIGNoYW5n
ZSBoZXJlIHdvdWxkIGNhdXNlCnRoaXMgcGF0dGVybiB0byBlbWl0IGEgdmVyeSBiaWcgd2Fybmlu
Zy4KCkkgZG9uJ3QgdGhpbmsgdGhpcyBjaGFuZ2Ugc2hvdWxkIGJlIGxhbmRlZC4KCgpDaGVuWXUK
Cj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICAgICAgICAgY2xrX3ByZXBhcmVfbG9jaygp
Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXB4YS5jIGIvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1weGEuYwo+IGluZGV4IDdhZDBlNWFkYjJmZmFjNDEyNWMzNDcx
MGZjNjdmNGI0NWYzMDMzMWQuLmY2NWZiMGI3ZmMzMThiNzY2MjI3ZTVlN2E0YzBmYjA4YmExMWM4
ZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1weGEuYwo+ICsrKyBi
L2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcHhhLmMKPiBAQCAtMjE4LDcgKzIxOCw3IEBAIHZv
aWQgX19pbml0IHB4YV90aW1lcl9ub2R0X2luaXQoaW50IGlycSwgdm9pZCBfX2lvbWVtICpiYXNl
KQo+Cj4gICAgICAgICB0aW1lcl9iYXNlID0gYmFzZTsKPiAgICAgICAgIGNsayA9IGNsa19nZXQo
TlVMTCwgIk9TVElNRVIwIik7Cj4gLSAgICAgICBpZiAoY2xrICYmICFJU19FUlIoY2xrKSkgewo+
ICsgICAgICAgaWYgKCFJU19FUlJfT1JfTlVMTChjbGspKSB7Cj4gICAgICAgICAgICAgICAgIGNs
a19wcmVwYXJlX2VuYWJsZShjbGspOwo+ICAgICAgICAgICAgICAgICBweGFfdGltZXJfY29tbW9u
X2luaXQoaXJxLCBjbGtfZ2V0X3JhdGUoY2xrKSk7Cj4gICAgICAgICB9IGVsc2Ugewo+Cj4gLS0K
PiAyLjQzLjAKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
