Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zE60AJ6SKmqzsgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 12:49:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9149D670FB5
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 12:49:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=CPLctrn8;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A664C424DE;
	Thu, 11 Jun 2026 10:49:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37881C46D45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 10:49:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso28926045e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 03:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781174940; x=1781779740;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T7qWssdHiLBFsSt8dH4a2h+fzHkfZe1zSV2zWUbUyiA=;
 b=CPLctrn8NSeXkXCEIDbsginqRiA+u/IC4gVThIqWH+OW5kZJZjrd3xbh0pygBzaXLu
 5vIKu5qZLQnF5qy8jgkNErI7hKeIJwYqLzd7n3xJBrHjvnVg0STyxGM3TGfV4H61UIes
 M00TJwny0xotlxRl9L6Qvv1ojUTgEvduVgVKfNN62mfEi0V2aD4X+tD3OenQhEnkkK2l
 bdE8Mvi1c7ORl9hjFap2N7GK+1jdncl4Tg85yq5z3RBuJ1Bfm/qCjBMF6APidEQ4yE+Q
 0Hu/y5ZIMzf1Ocg4PyJzZjgoMATd6KKDSU81pSqgPD9D8yh+Xn0dURGjXDOj1u36hIk0
 bGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781174940; x=1781779740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7qWssdHiLBFsSt8dH4a2h+fzHkfZe1zSV2zWUbUyiA=;
 b=o3mfiyq3dPQAEmihuwksLn694+zxr5Ufsa0I+DCyQ/MqS/2KanR2PqYXAeTR9v81If
 J5ai0jAeQL/li1ukFjcfmCKLEr2tBwbrUd5+8J/JQ38M/gs3f1LMxCVWEacqonD0NkDP
 G+MTMJhFMvBuISObHnW0UXs8cqc3RAxIbqzTUbPr7k0b30vp1+FrNWFaCMSDXCu8Ecy4
 S15nPIeZcfWKwo95KJ+0T33XKtI7BQrwyc0zby+afFK2Svm4An8iYr7zDY+pHTiBrbmJ
 g71VCVLPFbGbDzB9nkwykSkIY26hNV8QFAPGaj92qPd+H3hdh1ONc3iIBiPMJfyZwOIL
 fosA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VrxUVc6XEv8vmtJqsBzWP5aTqKZGd/Ccw4ssbDIv28TdUKYhEAacJA21sWDWpY8Y2Ux0mHrEO4r1z/Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxss+AUsVnfLsuoSj0foM3RDLKCb/Jp5dLTRnEZNa+bcRxHhpus
 aOhHVebRqLd1VNLSe4lfKITKv2yiHuF+AkWOpDFLz58VIOZ+JcZuluFt
X-Gm-Gg: Acq92OHk0/hNXn8YnJ5+mW6EL9zNV747zSMxmWKC4+jY1gHcwwssY6MPdhtQDjFAEv9
 F8vZwFTKnqPXVVfgJOvLJwobq+pJAI6WbyYKCjnjzkIhIXsoWs9piaDZ8AGHfvHMHS1fCEy1oGj
 HZlNN5jiIZl7oWdRg0hYzFHBv1zqWqkZxUQTsx2nssrDsZa0m2fK3S9SIWT5DGtDdh47kXJwx0L
 oBpgsFMZ2I6sEznM35MRdfYnRBET8Azppgts6HrRQvzAlBqrRCv1oZwmGmKzUuA3gvEEd4P+RPn
 ffAhThYaPXsHTftnjLliZoj3FQCejNb52s7g83qqmj1bRTXfrK7xS1xRzkXampiSj/lnZqtnFSN
 vl93zJ5+OkWsCfstB6I6qf0F/e41KIKG09efUH0+PnXKoJUDBuljHKoHlCAoWFrEAlpGSeXWB5T
 JJglspaSKg/R9dvezj5cF+G78VTveq/qXbCn0Jujv+uPD4MHMZO1a7Y5WsIkze8Ly+s7Mmux4Rz
 jX+MMXZKqoZ9g==
X-Received: by 2002:a05:600c:c054:b0:490:4b89:5362 with SMTP id
 5b1f17b1804b1-490e56146admr18108955e9.24.1781174939589; 
 Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
Received: from localhost.localdomain ([90.173.102.44])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ead0sm62775155e9.3.2026.06.11.03.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 03:48:59 -0700 (PDT)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
Date: Thu, 11 Jun 2026 12:48:56 +0200
Message-Id: <20260611104857.242153-1-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
 linux-kernel@vger.kernel.org, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: stm32f7: truncate clock period instead
	of rounding it
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:andi.shyti@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cedric.madianga@gmail.com,m:wsa@kernel.org,m:guille.rodriguez@gmail.com,m:linux-kernel@vger.kernel.org,m:pierre-yves.mordret@st.com,m:linux-i2c@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:cedricmadianga@gmail.com,m:guillerodriguez@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[guillerodriguez@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guillerodriguez@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9149D670FB5

c3RtMzJmN19pMmNfY29tcHV0ZV90aW1pbmcoKSBkZXJpdmVzIHRoZSBJMkMgY2xvY2sgc291cmNl
IHBlcmlvZAooaTJjY2xrKSB3aXRoIERJVl9ST1VORF9DTE9TRVNULCB3aGljaCBtYXkgcm91bmQg
aXQgdXAuIFdoZW4gdGhlCnBlcmlvZCBpcyBvdmVyZXN0aW1hdGVkLCBhbGwgdGltaW5ncyBjb21w
dXRlZCBmcm9tIGl0IChTQ0xERUwsClNEQURFTCwgU0NMTCwgU0NMSCkgY29tZSBvdXQgc2hvcnRl
ciBvbiB0aGUgd2lyZSB0aGFuIGNhbGN1bGF0ZWQsCmFuZCB0aGUgcmVzdWx0aW5nIGJ1cyByYXRl
IGNhbiBleGNlZWQgdGhlIHJlcXVlc3RlZCBzcGVlZCwgdmlvbGF0aW5nCnRoZSBJMkMgc3BlY2lm
aWNhdGlvbiBtaW5pbXVtcyBmb3IgdExPVyBhbmQgdEhJR0guCgpGb3IgZXhhbXBsZSwgd2l0aCBh
IDEwNC40NSBNSHogY2xvY2sgc291cmNlIChlLmcuIFBDTEsxLCB0aGUKcmVzZXQtZGVmYXVsdCBJ
MkMgY2xvY2sgc291cmNlIG9uIFNUTTMyTVAxKSwgaTJjY2xrIGlzIHJvdW5kZWQgZnJvbQo5LjU3
NCBucyB1cCB0byAxMCBucy4gUmVxdWVzdGluZyBhIDQwMCBrSHogZmFzdCBtb2RlIGJ1cyB3aXRo
CjcyLzI3IG5zIHJpc2UvZmFsbCB0aW1lcyBhbmQgbm8gYW5hbG9nL2RpZ2l0YWwgZmlsdGVycyB0
aGVuIHByb2R1Y2VzCmFuIGFjdHVhbCBidXMgcmF0ZSBvZiA0MTUuNiBrSHogd2l0aCB0TE9XID0g
MTI1NCBucywgdmlvbGF0aW5nIGJvdGgKdGhlIDQwMCBrSHogbWF4aW11bSByYXRlIGFuZCB0aGUg
MTMwMCBucyB0TE9XIG1pbmltdW0gb2YgdGhlCnNwZWNpZmljYXRpb24uCgpUcnVuY2F0ZSB0aGUg
cGVyaW9kIGluc3RlYWQsIHNvIHRoYXQgaXQgY2FuIG9ubHkgYmUgdW5kZXJlc3RpbWF0ZWQuClRo
ZSBlcnJvciB0aGVuIGZhbGxzIG9uIHRoZSBzYWZlIHNpZGU6IHRoZSBwcm9ncmFtbWVkIHRpbWlu
Z3MgY29tZQpvdXQgc2xpZ2h0bHkgbG9uZ2VyIHRoYW4gY29tcHV0ZWQgYW5kIHRoZSBidXMgcnVu
cyBtYXJnaW5hbGx5IGJlbG93CnRoZSB0YXJnZXQgcmF0ZSAoMzc1LjMga0h6IGluIHRoZSBleGFt
cGxlIGFib3ZlKSB3aGlsZSBtZWV0aW5nIHRoZQpzcGVjaWZpY2F0aW9uLgoKaTJjYnVzIGlzIGxl
ZnQgcm91bmRlZC10by1jbG9zZXN0OiBpdCBpcyBvbmx5IHVzZWQgYXMgdGhlIHRhcmdldCBvZgp0
aGUgY2xrX2Vycm9yIGNvbXBhcmlzb24gYW5kIGlzIG5ldmVyIG11bHRpcGxpZWQgaW50byB0aGUg
cHJvZ3JhbW1lZAp0aW1pbmdzLCBzbyBuZWFyZXN0IHJvdW5kaW5nIHJlbWFpbnMgYWNjdXJhdGUg
dGhlcmUuCgpGaXhlczogYWViMDY4YzU3MjE0ICgiaTJjOiBpMmMtc3RtMzJmNzogYWRkIGRyaXZl
ciIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEd1aWxsZXJtbyBS
b2Ryw61ndWV6IDxndWlsbGUucm9kcmlndWV6QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXN0bTMyZjcuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtc3RtMzJmNy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdG0zMmY3LmMKaW5kZXgg
NTNkOWRmNzBlYmU0Li42NDM5NjIwZDZiZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtc3RtMzJmNy5jCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCkBA
IC00NjQsOCArNDY0LDEzIEBAIHN0YXRpYyBpbnQgc3RtMzJmN19pMmNfY29tcHV0ZV90aW1pbmco
c3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiwKIHsKIAlzdHJ1Y3Qgc3RtMzJmN19pMmNf
c3BlYyAqc3BlY3M7CiAJdTMyIHBfcHJldiA9IFNUTTMyRjdfUFJFU0NfTUFYOwotCXUzMiBpMmNj
bGsgPSBESVZfUk9VTkRfQ0xPU0VTVChOU0VDX1BFUl9TRUMsCi0JCQkJICAgICAgIHNldHVwLT5j
bG9ja19zcmMpOworCS8qCisJICogVHJ1bmNhdGUgaW5zdGVhZCBvZiByb3VuZGluZyB0byBjbG9z
ZXN0OiBpZiB0aGUgY2xvY2sgcGVyaW9kIGlzCisJICogb3ZlcmVzdGltYXRlZCwgdGhlIGNvbXB1
dGVkIFNDTCB0aW1pbmdzIHdpbGwgY29tZSBvdXQgc2hvcnRlciBvbgorCSAqIHRoZSB3aXJlLCB3
aGljaCBjYW4gcHVzaCB0aGUgYnVzIGFib3ZlIHRoZSB0YXJnZXQgcmF0ZSBhbmQgYmVsb3cKKwkg
KiB0aGUgc3BlYydzIHRMT1cvdEhJR0ggbWluaW11bXMuCisJICovCisJdTMyIGkyY2NsayA9IE5T
RUNfUEVSX1NFQyAvIHNldHVwLT5jbG9ja19zcmM7CiAJdTMyIGkyY2J1cyA9IERJVl9ST1VORF9D
TE9TRVNUKE5TRUNfUEVSX1NFQywKIAkJCQkgICAgICAgc2V0dXAtPnNwZWVkX2ZyZXEpOwogCXUz
MiBjbGtfZXJyb3JfcHJldiA9IGkyY2J1czsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
