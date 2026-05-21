Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFwHOmycDmqTAgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 07:47:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA459F34F
	for <lists+linux-stm32@lfdr.de>; Thu, 21 May 2026 07:47:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF09C87ED1;
	Thu, 21 May 2026 05:47:23 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C06E9C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 May 2026 05:47:22 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-8b7105dfb35so73469576d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 22:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779342441; cv=none;
 d=google.com; s=arc-20240605;
 b=gzbz50eOJ3EAfnV1mlKsdqIFhvcHg2U5vYMC9YjJ3eCaZAB/z3cmEiO8xiPIIT0IqV
 XPa6tbxxfB9v60rX2C5xap+LKQgsEeiJlPh+U+LFvTskIbTHkD6320d0gzY+NLdzq/oa
 KdzSLZl7zrzbFva3mJmPTYNEVR5apZioD8F9hCNINlWYPT2yK5CohI8Tp6nxQ0G5d+BD
 tTo7TfEez/MJoMIcJ72I/Xq+v+GSBo10GoME+wWs7Zs4/fyehg4GjL+ku5Wpwxs/jhu9
 tBOHaIHzNqi0cykBgwFHOrfvoP75Dn3PZCL/tIpWwvcf9llj+eM5RRCpqvMa6uXRV0w9
 4DqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
 fh=vrR2Wic+DUX8484qUxqEhxm8I7T2UwtzV31pT06zeUo=;
 b=UdYAqF5pKq+6ZCQqBPRWrctkGsF7FU5Tohc5IS6ZAjfK/Ax5nVwOCZr+ACisjYUT1Q
 /qHjigrIP/Xy1dL7jhczRNdARFFIG8VIBwbHqOl3DwfgFhVtjWbb/f6/XgSqxe9s4sTi
 d+vDZULTo5Zoy0u2KLGeHv9PMIaBgUMI48dWH+Zo2THkQ111+yEhaC+r2xr1yHuqayRB
 Ji8/sO/YZacJDrdeBB4TlCxaESr502AGShDmtY5uIvbcvLL1oXelzYbzwV0VrnebucRr
 e2fuAjZ5RntNnD2LPLPkk+mqXGzeuoZJ6i23+zbfb7TIAQaBGzLO86d0KvwDO/eA1grJ
 9Afw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779342441; x=1779947241;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
 b=Tkx2GPUNrOhtrAJn/+OBUAaSVxxomYh3L6eAevxmjhs5I6aWUrECtoZkyZb/FGlkxU
 94BTAP+eA/PZxdu+kKOUD7+ZZP3KxBwJYnEwx2ekcBhS9l27tBGhEpltn2YD6/5upWE8
 dKjXBWNIZsYae6XdUXyXxzq9jZTyHxT5HBHbbX5yzSXSjeOk5mo6pNYNhJqzdqYrC93J
 DepWSe4QhI99OdypOKXiEZQ8oOo+WlGH0A1c5IStIv72jhu5OTxoyw3Vpg+XS7Djzjy8
 7WBo45FVdHonFShqBlYOA8Nhzs8JiOU/Ix4+BucnAhCWqpF3WysragCp9xdJE8B1VB3t
 C/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779342441; x=1779947241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
 b=GljTk+OnFT5b/XT3dKFniuyUGoU8E0JZy8sUKiLcmZKC3Pc6OB12BSAlbfCyQLpW7s
 HfEnpzYmkiCqJajxMqeMYuZPDC7nLVipEd28Bv64ktT9HwH9c2HnZHiI6w40KdpqBxG5
 jGjXvAC0u5OMK/5qZEJEE2OSUwRRh/rIZ6Cr49cWod3XL6qPFlfXuOVDlPq26KyrCEUW
 wPtlrAT73rf/7jBhn79HgjLmUOHZwsfDzj/QXWBkIOLYZc9OIzlDSGVT4+lb9N11Sma8
 gNOjtNyrv/7kalh87a3oM5ArZAi02OhH/IdBmruu1Cemcu6xtLFI+fZ13snMFqn9Kmw+
 QU1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jQRCzaxpBi4wCM54Vho96IL2pNdy9O32Ikd57ezTGFeZY1R2+sAxNLSsj4HLRxchvvnefuXDZYwsVOw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJcAdPIn4G4pL+P4/+JyP70iBoaGr+vG9Y6fk4oxhO5RsQYlx5
 jtG8x8PQcs6eoMO3zWGuufcBLq5IX+tHEkoXNp+4coi6MGG+vyyBeesYb36y540IG/Fre+6tzyf
 pHHEip6HMGW9CPemxrT/E8QTodqJ1rY8=
X-Gm-Gg: Acq92OEdpUvS3I06WDhgtMaFOluapyVcx3HwB8L9VRgLkU9OOlxvJ7kTJGYPSRT+Csk
 27lC/vBCQAfcAANKi8Yo5VLy7h63TaNWVyb7PB8FLEm742r4IFe3fM0lk/TwFv0eq2ENTMo8/AK
 552ZyXSSzSpmPphmx0dvdDLnbiUWcyeaR8VIvCkWPgJlP7aLEq/AmMth/M0rreCqn5UaODBpTaE
 +GaMdX7bGl4oVaLwu/lkFuMqVTHX8YlNFc1g7920XAZXFgGkCa0S4D80ojDXSslKdOA0W64sL4o
 tEliU1+/9TKnYB1tq6EWgo0aQBt+983StlPE2UsdAyhXZehp/A==
X-Received: by 2002:a05:6214:4589:b0:8ac:b1ad:3a24 with SMTP id
 6a1803df08f44-8cc6e369142mr24275146d6.27.1779342441405; Wed, 20 May 2026
 22:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260509193928.19030-1-manishbaing2789@gmail.com>
 <agnY16I4sYAdRd9T@monoceros>
In-Reply-To: <agnY16I4sYAdRd9T@monoceros>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Thu, 21 May 2026 11:17:10 +0530
X-Gm-Features: AVHnY4KAzV-NI5cDZgO-6QHQZfraoFlbvvmbGV2Hd6qkCVQ1Ph4LlYmyO8Rq1VQ
Message-ID: <CAJvdc_enTOF=+1rumSz4FD5T1ME0fnJ+SVC+jMuOTMxzyx8P1Q@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linusw@kernel.org, lee@kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: mfd: st,
 stmpe: fix PWM schema and drop legacy binding
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linusw@kernel.org,m:lee@kernel.org,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 86FA459F34F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVXdlLAo+IElmIHRoZSBwYXRjaCB3YXMgc3BsaXQgaW50byB0d28sIGVhY2ggdG91Y2hpbmcg
anVzdCBvbmUgb2YgdGhlIGZpbGVzLAo+IHRoZXJlIHdvdWxkIGJlIG5vIG5lZWQgZm9yIG1lcmdl
IGNvb3JkaW5hdGlvbi4gQWxzbyBsb2dpY2FsbHkgaXQncyB0d28KPiBwYXRjaGVzLiBXb3VsZCB5
b3UgbWluZCBzcGxpdHRpbmc/CgpUaGF0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UuIEkgd2lsbCBzcGxp
dCB0aGlzIGludG8gYSB0d28tcGF0Y2ggc2VyaWVzCihvbmUgZm9yIHRoZSBNRkQgWUFNTCBmaXgg
YW5kIG9uZSBmb3IgdGhlIFBXTSBUWFQgZGVsZXRpb24pIGFuZCBzdWJtaXQKaXQgc2hvcnRseSBh
cyB2NC4KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shCgpUaGFua3MgYW5kIFJlZ2FyZHMsCk1hbmlz
aAoKCk9uIFN1biwgTWF5IDE3LCAyMDI2IGF0IDg6MzXigK9QTSBVd2UgS2xlaW5lLUvDtm5pZyA8
dWtsZWluZWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIFNhdCwgTWF5IDA5
LCAyMDI2IGF0IDA3OjM5OjI4UE0gKzAwMDAsIE1hbmlzaCBCYWluZyB3cm90ZToKPiA+IFRoZSBz
dCxzdG1wZS1wd20gYmluZGluZyBpcyBhbHJlYWR5IGNvdmVyZWQgYnkgdGhlIE1GRCBzY2hlbWEg
aW4KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtcGUueWFt
bC4gSG93ZXZlciwgdGhlCj4gPiBQV00gc3Vibm9kZSB3YXMgbWlzc2luZyBhICdyZXF1aXJlZCcg
cHJvcGVydGllcyBibG9jay4gVGhpcyBhbGxvd2VkCj4gPiBEZXZpY2UgVHJlZSBub2RlcyB0byBw
YXNzIHZhbGlkYXRpb24gZXZlbiBpZiB0aGUgJ2NvbXBhdGlibGUnCj4gPiBzdHJpbmcgd2FzIG9t
aXR0ZWQuIFRoaXMgb21pc3Npb24gY291bGQgbGVhZCB0byBwcm9iZSBmYWlsdXJlcwo+ID4gYXQg
cnVudGltZS4KPiA+Cj4gPiBGaXggdGhlIHNjaGVtYSBieSBhZGRpbmcgdGhlIG1pc3NpbmcgJ3Jl
cXVpcmVkJyBibG9jayBhbmQKPiA+IHJlbW92ZSB0aGUgb2Jzb2xldGUgYW5kIHJlZHVuZGFudCB0
ZXh0IGJpbmRpbmcgZmlsZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYW5pc2ggQmFpbmcgPG1h
bmlzaGJhaW5nMjc4OUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAt
IEFkZGVkICdyZXF1aXJlZCcgcHJvcGVydGllcyB0byB0aGUgcHdtIHN1Ym5vZGUgaW4gc3Qsc3Rt
cGUueWFtbAo+ID4gICB0byBjbG9zZSBhIHZhbGlkYXRpb24gZ2FwIGlkZW50aWZpZWQgYnkgdGhl
IFNhc2hpa28uCj4gPiAtIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgYW5kIGRlc2NyaXB0aW9uIHRv
IHJlZmxlY3QgTUZEIHN1YnN5c3RlbSBjaGFuZ2VzLgo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4g
PiAgLSBEcm9wcHBlZCB0aGUgVFhUIGZpbGUgaW5zdGVhZCBvZiBjb252ZXJ0aW5nIHRvIFlBTUws
IGFzIHRoZQo+ID4gICAgZnVuY3Rpb25hbGl0eSBpcyBhbHJlYWR5IGNvdmVyZWQgYnkgc3Qsc3Rt
cGUueWFtbC4KPiA+Cj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bXBlLnlh
bWwgICAgICB8ICA0ICsrKysKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vc3Qsc3Rt
cGUtcHdtLnR4dCAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCj4KPiBJZiB0aGUgcGF0Y2ggd2Fz
IHNwbGl0IGludG8gdHdvLCBlYWNoIHRvdWNoaW5nIGp1c3Qgb25lIG9mIHRoZSBmaWxlcywKPiB0
aGVyZSB3b3VsZCBiZSBubyBuZWVkIGZvciBtZXJnZSBjb29yZGluYXRpb24uIEFsc28gbG9naWNh
bGx5IGl0J3MgdHdvCj4gcGF0Y2hlcy4gV291bGQgeW91IG1pbmQgc3BsaXR0aW5nPwo+Cj4gQmVz
dCByZWdhcmRzCj4gVXdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
