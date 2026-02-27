Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PyYJNK3oWm+vwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:27:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7A1B9C11
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:27:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2623C87EC5;
	Fri, 27 Feb 2026 15:27:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDBBCC87EC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:27:12 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-483708b697cso2864055e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 07:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772206032; x=1772810832;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uI9S2P6c8egIXJKKMSmeFGi+qUnJg7oBI+XRfv5Q1so=;
 b=AjyHEyWJEhkgBbu97WIfSlFdRo4Yk5JtuW/dyzd6LhU794FiHxqYO34AbTMb2OEram
 fGxUYRu+WfP71341aIlghFd4pkcBWsaefJMZwiiuvUq2fsc9m9zNlPkhc9BZBBILfI/l
 w7aW4AN9BvjLxL2KL1ka2J/s1RpbnzhKp6wi7Zxf29hQLVh9qigOMP+sXZcdSzoPBOx6
 22B8yGMnmGjN8H9lUZ+FLBacQWsuCzKkzGOJVTafMwE4epCc2Vp1reSA+RFSpTGvXY9V
 9SF9v3UZ5IT8/AQEUA0NSxwbWnCAFfk2iRlEgqFBkEs8v0cG6T3GO80yVu8PtAJEcy6j
 uBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772206032; x=1772810832;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uI9S2P6c8egIXJKKMSmeFGi+qUnJg7oBI+XRfv5Q1so=;
 b=SHtWVipLEIQZd4fwXmckkxDA/oo+2XECHJHu8VQbMfd76wnEJ1Fm5GmhH3k2AgZIAZ
 Tjv23NDCpJqH6hdqCoisQTaVLTdx4sLTV2f2y7WpLeXOPXr8Fqmm7yvqnjrz/aG3HW70
 Z5sJ/WPmLbN1QQGYjTbc2ToQydqrB2dKndiFO4fCqnqnln2heEMIw4Gegf2Gt5Svb9Ia
 oSqEstm5ln5cw6xd+joO60RpZarODFmXaJBmOoJTUrxV63oa+8QmJX5h3h1cMjnk6xsd
 1lauo6EsjIRl+m4Cu4LIyBfPpMjh3wAMOKrbXJIephPd77noG7PjRX6U2+zxalhtoNLv
 6sdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBW5uhh7JlLyEaH0QtwEAMiAjbsyfbbFzetLhKFYoQEde+2EyhiY6RyctrMuWoEJoAtViREobSHncwVQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNBnNuST1Q/hPSiP5gWr06sAPvGqOrfWPmNK6LA/O2GlKsKKtc
 KCx3VrortkTUxaEnk9OjT/dlZKr6mpctDtx0T5eG4JdL93PKKLUPJmmP
X-Gm-Gg: ATEYQzz58MSWFKiG0dojggoHXzA4PjcDVxNV5GPY+J6ZCxCsBiha7KkXExB+4ORqdQQ
 VeEEYCHxW7nUnG694ucaQEQ5is5ImSsY6Fj112joNsuPmVewK2w0bB4ROHHixdx85aOlpB1vU+D
 fo94OsMhqEzOEaqO+SIwlr/RQQCRg4ecXpmhLsmYW+f2cd90iXF/vpoWgH7TvjxM00IPAiIAuDW
 3ELwjvsjSM/evCyB+yFLIaeluwE7OBjDclCTHeKbDDwZhbjenNkBz+aAroYIUIRCWcpxeruQjr0
 BUMRPG2Os9Jq0/pV/dvextmRK7hmtPUIJPCkHReBNFkEJ//KWL4OwuCu6lEe00GKgC/YgZoSG4v
 1f6AvEQqY/fWy3alu0907ZRVSgU2qgUWm8/fUfk0x/ABpnLvTrXuxnHIXHZBtvGlG5Swkhvt78k
 hzdDLzMs3jltMWVJVM7M+2DhwX
X-Received: by 2002:a05:600c:444f:b0:477:a6f1:499d with SMTP id
 5b1f17b1804b1-483c9c1bbdcmr27647755e9.3.1772206031724; 
 Fri, 27 Feb 2026 07:27:11 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm360231605e9.0.2026.02.27.07.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 07:27:10 -0800 (PST)
Date: Fri, 27 Feb 2026 17:27:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20260227152707.k5lobznug3xxxc7h@skbuf>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk> <aaGgWUpM2A5y11Wh@vaman>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaGgWUpM2A5y11Wh@vaman>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: qcom-ethqos:
 further serdes reorganisation
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.938];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 2DF7A1B9C11
X-Rspamd-Action: no action

SGkgVmlub2QsCgpPbiBGcmksIEZlYiAyNywgMjAyNiBhdCAwNzoxNzowNVBNICswNTMwLCBWaW5v
ZCBLb3VsIHdyb3RlOgo+IE9uIDI1LTAyLTI2LCAwOTowMiwgUnVzc2VsbCBLaW5nIChPcmFjbGUp
IHdyb3RlOgo+ID4gTm90ZTogb25seSA4IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMsIG5vdCA5IGFz
IHRoZSBzdWJqZWN0IGxpbmUgc2F5cywKPiA+IGFzIHRoZSBzZXRfY2xrX3R4X3JhdGUoKSBwYXRj
aCBiZWNhbWUgcGFydCBvZiB0aGUgZmlyc3Qgc2VyaWVzLgo+ID4gCj4gPiBPbiBXZWQsIEZlYiAy
NSwgMjAyNiBhdCAwOTowMDo0MUFNICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6
Cj4gPiA+IFRoaXMgaXMgcGFydCAyIG9mIHRoZSBxY29tLWV0aHFvcyBzZXJpZXMsIHBhcnQgMSBo
YXMgbm93IGJlZW4gbWVyZ2VkLgo+ID4gPiAKPiA+ID4gVGhpcyBwYXJ0IG9mIHRoZSBzZXJpZXMg
Zm9jdXNlcyBvbiB0aGUgZ2VuZXJpYyBQSFkgZHJpdmVyLCBidXQgdGhlc2UKPiA+ID4gY2hhbmdl
cyBoYXZlIGRlcGVuZGVuY2llcyBvbiB0aGUgZXRoZXJuZXQgZHJpdmVyLCBoZW5jZSB3aHkKPiA+
ID4gaXQgd2lsbCBuZWVkIHRvIGdvIHZpYSBuZXQtbmV4dC4gRnVydGhlcm1vcmUsIHN1YnNlcXVl
bnQgY2hhbmdlcwo+ID4gPiBkZXBlbmQgb24gdGhlc2UgcGF0Y2hlcy4KPiAKPiBUaGlzIGxndG0s
IGNhbiB3ZSBnZXQgc2lnbmVkIHRhZyBzbyB0aGF0IHdlIGNhbiBwdWxsIHRoaXMgaW50byBwaHkg
dHJlZQo+IGFzIHdlbGwKCkkgdGhpbmsgdGhpcyBzZXJpZXMgaXMgb2Jzb2xldGUuIEl0IGhhcyBi
ZWVuIHN1cGVyc2VkZWQgaW4gdGhlIG5ldGRldgpwYXRjaHdvcmsgYnk6CgpbUEFUQ0ggUkVTRU5E
MiBuZXQtbmV4dCAwLzhdIG5ldDogc3RtbWFjOiBxY29tLWV0aHFvczogZnVydGhlciBzZXJkZXMg
cmVvcmdhbmlzYXRpb24K4pSc4pSAPltQQVRDSCBSRVNFTkQyIG5ldC1uZXh0IDEvOF0gbmV0OiBz
dG1tYWM6IHFjb20tZXRocW9zOiBtb3ZlIGV0aHFvc19zZXRfc2VyZGVzX3NwZWVkKCkK4pSc4pSA
PltQQVRDSCBSRVNFTkQyIG5ldC1uZXh0IDIvOF0gcGh5OiBxY29tLXNnbWlpLWV0aDogYWRkIC5z
ZXRfbW9kZSgpIGFuZCAudmFsaWRhdGUoKSBtZXRob2RzCuKUnOKUgD5bUEFUQ0ggUkVTRU5EMiBu
ZXQtbmV4dCAzLzhdIG5ldDogc3RtbWFjOiBxY29tLWV0aHFvczogY29udmVydCB0byB1c2UgcGh5
X3NldF9tb2RlX2V4dCgpCuKUnOKUgD5bUEFUQ0ggUkVTRU5EMiBuZXQtbmV4dCA0LzhdIHBoeTog
cWNvbS1zZ21paS1ldGg6IHJlbW92ZSAuc2V0X3NwZWVkKCkgaW1wbGVtZW50YXRpb24K4pSc4pSA
PltQQVRDSCBSRVNFTkQyIG5ldC1uZXh0IDUvOF0gcGh5OiBxY29tLXNnbWlpLWV0aDogdXNlIFBI
WSBpbnRlcmZhY2UgbW9kZSBmb3IgU2VyRGVzIHNldHRpbmdzCuKUnOKUgD5bUEFUQ0ggUkVTRU5E
MiBuZXQtbmV4dCA2LzhdIHBoeTogcWNvbS1zZ21paS1ldGg6IHJlbW92ZSBxY29tX2R3bWFjX3Nn
bWlpX3BoeV9pbnRlcmZhY2UoKQrilJzilIA+W1BBVENIIFJFU0VORDIgbmV0LW5leHQgNy84XSBw
aHk6IHFjb20tc2dtaWktZXRoOiByZWxheCBvcmRlciBvZiAucG93ZXJfb24oKSB2cyAuc2V0X21v
ZGUqKCkK4pSU4pSAPltQQVRDSCBSRVNFTkQyIG5ldC1uZXh0IDgvOF0gbmV0OiBzdG1tYWM6IHFj
b20tZXRocW9zOiByZW1vdmUgcGh5X3NldF9tb2RlX2V4dCgpIGFmdGVyIHBoeV9wb3dlcl9vbigp
Cgood2l0aCB3aGljaCBpdCBpcyBvbmx5IHBhcnRpYWxseSBvdmVybGFwcGluZykKCkkgZ3Vlc3Mg
eW91IHNob3VsZCBnaXZlIHlvdXIgQWNrcyB0aGVyZSBhcyB3ZWxsLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
