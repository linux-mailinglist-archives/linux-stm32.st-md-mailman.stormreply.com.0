Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A0B2B98B
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 08:36:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDBBFC3F942;
	Tue, 19 Aug 2025 06:36:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2AA2C3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2XJNe025503
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 19 Aug 2025 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=BNDtdStOIIki9xxSs9/BB+
 Gr6oUDaLjPxhFCW+eeQCc=; b=EyEyXonYYSs6oBIqd3Ln5w1LpBUuXayPhDojXS
 NG3ErmNfjJRADyOdJxZpec0t5sgSYnVXjcmQgssv+XIKCSo6Ktz4xCY4FYYpWLpu
 dfHqSkicd/mXXWD+b+RotNQ3fkTpa0caLH/YBCZg4RPJ9VFIJJJi3EzNjn1l4wWr
 e+s4Z4jn3jHVDXotpBwc9YkwHda1nXxTyBzzWdsYK6g64gt54bhYSR9kA9ALF3EO
 wkwoGgh+/aV32Zxy6rY3iP2jFQHqOQMaqULtUc1AnYiFQtK8rDg3ZTFYkwu59T6A
 ADSgjhXywDifKfwj50jTFX9sg3FlAJQye+dlNtvgJ39sA2LQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cj66y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:36:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24457f44a29so60393365ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 23:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755585396; x=1756190196;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BNDtdStOIIki9xxSs9/BB+Gr6oUDaLjPxhFCW+eeQCc=;
 b=bQd+Uajo3JmHBTLuUFm87wx26vA6tqIDAJ/ORFR7NN/ArVAO5ZGkT4SIwH5DHqdJ+4
 H2+fmO4WAqbGDsiJPjjbl5cQZS3dQ9T0EGwSHwiqxpU4YlPtHxvadhbcwjlACdR8wtTS
 +vLzmb4x/WpGeNzFTPp50mr149bWq+rXHZ04d14B5WkLdA37sxYlfK2smfkGY851Qi77
 lCOwUsru3wPqYYJHheVHWTL0iT1098EHF3CO9BjW945oeSaX/ucVQEScAZTvjqBmGdey
 CXfxtT1PTXH6kbc61evlwIkKszwjAZsvWlByEk/P2bMcgxg/GQ6BjbCJqK3+AaDYBG4n
 tjOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNIj48P+unOUXiGv9UNTyK7lt7qiWurh2sRl34wLwioV2cmIrmrOfv7GfmMx7414Y+NWAQzDajg5HN0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPfyDMkzx2TUXEkDQPEBLgzMO7l9ts9FLsp4FNbchZSiuzRZ1v
 0aDL3YY6yAipWseV1YGdk63USRYYrjkWY/Dv6wlAD6u11A3W4oJn5N6bCfH0GcITvyTxY1qYKOc
 UD6wcDRtdHLxV+NzxQcgsJQNQ+oREpSWSMmemvLsT0zFvf2DYEppw7GUa4dVsazoROf9jhgE7CZ
 tRyrmbCgI=
X-Gm-Gg: ASbGncuvsoECgQYgj529Cvxq/5zEfJ23F8TN5lT3t5GxzQ17pBTIKhgb36YfnOtyFgp
 oHaqBNPECRsSjZy4mkkXWcY+6XQIlaxiRhmfHFV1kffuyeqXD+mwRHveYTLuCEvYeTvv7ugJ49V
 ka2zsZ82NXMav/jDtxmqgofucbuJtrwSGp7txsCqFHLmsVkMaGXBjrBbfBMxgAD2RlTw8OBkh0h
 Zwy7HXFIplFmDm/HRa2bvmKVnvPXG4zuazivk5phUZTYqOfSBHZpd3sjcqq8ywc/50lkJ2eZdPY
 BVUKKeTpqXspYOwq7h4ymhLenkBaFhEsiW8Cr7yjCO6Wdjx3VxNk/4hj7roOLAQxkHsjQo0VuuZ
 s4h7wsjjnHuF0cXsnE8ceEXvCoNeDR0i0bA==
X-Received: by 2002:a17:903:1a0f:b0:23f:d8e4:ded2 with SMTP id
 d9443c01a7336-245e04fa7ecmr18015875ad.53.1755585396141; 
 Mon, 18 Aug 2025 23:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7x2rlLjLEjoY6XNFKv6eIKH4qPemYI90LbCuQyKWX6k4A4fAbmZ2rJWHEIcg7kMoDk+m1Xg==
X-Received: by 2002:a17:903:1a0f:b0:23f:d8e4:ded2 with SMTP id
 d9443c01a7336-245e04fa7ecmr18015545ad.53.1755585395617; 
 Mon, 18 Aug 2025 23:36:35 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 23:36:35 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:55 +0800
Message-Id: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEwbpGgC/y2OzQ6DIBCEX8Vw7jaCP5Ge+h6NMYhr5SBWoMbG+
 O5d0eNkZr6ZjXl0Bj17JBtzuBhvJksivyVMD8q+EUxHmolUFGnFM5i1L3nRYBhAopC5KMpe8ox
 R4eOwN2uEvWrSrfIIrVNWDweCKk0X/JV0OH9pLZzxM6uncTThkVhcA1yLgh2owfgwuV+8ufDYi
 D4XHIjZnK9gySCFXuW5LGWRdpV60og2Vt8Jzep93/9hUL5Z8QAAAA==
X-Change-ID: 20250813-qcs615_eth-9e294256f913
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585387; l=1876;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=8rX82cXmDkiy7mxoulbCd1tP0xA4NYjLb7c/ZyHx9wE=;
 b=aePfqudwbcAPoG0PPnBbU0FLS0s8F7btntlHW3vUPmGfocAQIUpjWpRbyjMfijPe2uqxhVKJY
 McDY75ufw3tBmlF2fvkzXQ/MPEjYHaStCQJMuO2NDkjLw3U+Y3RiqW5
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: CsA1LZBsKkdMwlJX5NGK9sPTiIi6xTsh
X-Proofpoint-GUID: CsA1LZBsKkdMwlJX5NGK9sPTiIi6xTsh
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a41b76 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=wApU7nzg8TAj0S4BVTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX5dTsYl6WhvFp
 X5+oTmphhbQjJLudc3/x/mtJruHELOZeldgMSofhXMWnTPJRcDHEvrAU38LBhNU6ADpfp7VZjU2
 BnqiHv+E1hNBx5kwTnkAHtLKBK29KjApijmDvBS87dQfI1rpM9nXdD/YRma0LHnD0migz1Xaczs
 EP00DPU7EJzXzFLzbGay5Jlu4inUNsNEDQWSYmQhTVbvPrIzJCDeCQawFxDC6/ARGIxsmmdOEKO
 6YGvTI7x4WW1vvFAxJ49so+Mz+hPQ/Pjt3ob4A0Ga740xrP4mMXVMJZS1nh7nHXdnWc5fQKuqDO
 ddgxhSQV1Mghcy6q2taIYEVQUkqBgYIYk6Ly5hvvP5MEgXg5yf1fjYkU3mHrb3c06pkISECsTQM
 +6hkR/mZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
Cc: stable+noautosel@kernel.org, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yijie Yang <quic_yijiyang@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [Linux-stm32] [PATCH v4 0/6] Enable ethernet on qcs615
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

QWRkcyBkZXZpY2UgdHJlZSBub2RlcyBhbmQgRU1BQyBkcml2ZXIgZGF0YSB0byBlbmFibGUgRXRo
ZXJuZXQKZnVuY3Rpb25hbGl0eSBvbiB0aGUgUUNTNjE1LVJJREUgcGxhdGZvcm0sIHN1cHBvcnRp
bmcgYWxsIHRocmVlCnN0YW5kYXJkIHNwZWVkcy4KClN3aXRjaGVzIHRoZSBzZW1hbnRpYyBpbnRl
cnByZXRhdGlvbiBvZiAncmdtaWknIGFuZCAncmdtaWktaWQnIGluIHRoZQpkcml2ZXIgY29kZSB0
byBtYXRjaCB1cHN0cmVhbSBMaW51eCBrZXJuZWwgZGVmaW5pdGlvbnMuIFVwZGF0ZXMgdGhlCmRl
dmljZSB0cmVlIGZpbGVzIGZvciBhZmZlY3RlZCBib2FyZHPigJRRQ1M0MDQtRVZCLTQwMCBhbmQg
U0E4MTU1LUFEUOKAlAphY2NvcmRpbmdseSB0byBlbnN1cmUgY29uc2lzdGVudCBiZWhhdmlvciBh
Y3Jvc3MgcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogWWlqaWUgWWFuZyA8eWlqaWUueWFuZ0Bv
c3MucXVhbGNvbW0uY29tPgotLS0KSW50ZWdyYXRlcyB0aGUgdGhyZWFkOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNDEyMjUtc3VwcG9ydF8xMG0xMDBtLXYxLTAtNGI1MmVmNDhiNDg4
QHF1aWNpbmMuY29tLwoKQ2hhbmdlcyBpbiB2NDoKLSBDaGFuZ2UgdGhlIHBoeS1tb2RlIG9mIFFD
UzQwNC1FVkItNDAwMCBhbmQgU0E4MTU1LUFEUCB0byByZ21paS1pZC4KLSBSZW1vdmUgdGhlIERU
IGJpbmRpbmcgY2hhbmdlIHJlbGF0ZWQgdG8gdGhlIHBoeS1tb2RlIGRlZmluaXRpb24uCi0gVXBk
YXRlIGJhc2UgY29tbWl0LgotIERyb3AgQUJJIGNvbXBhdGliaWxpdHkgYW5kIHVwZGF0ZSB0aGUg
ZHJpdmVyIGNvZGUgYWNjb3JkaW5nbHkuCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjUwMTIxLWR0c19xY3M2MTUtdjMtMC1mYTQ0OTY5NTBkOGFAcXVpY2luYy5j
b20vCgotLS0KWWlqaWUgWWFuZyAoNik6CiAgICAgIG5ldDogc3RtbWFjOiBBZGQgc3VwcG9ydCBm
b3IgMTAgTWJwcyBhbmQgMTAwIE1icHMgRXRoZXJuZXQgc3BlZWRzCiAgICAgIG5ldDogc3RtbWFj
OiBJbnZlcnNlIHRoZSBwaHktbW9kZSBkZWZpbml0aW9uCiAgICAgIGFybTY0OiBkdHM6IHFjb206
IHFjczYxNTogYWRkIGV0aGVybmV0IG5vZGUKICAgICAgYXJtNjQ6IGR0czogcWNvbTogcWNzNjE1
LXJpZGU6IEVuYWJsZSBldGhlcm5ldCBub2RlCiAgICAgIGFybTY0OiBkdHM6IHFjb206IHFjczQw
NDogSW52ZXJzZSBwaHktbW9kZSBmb3IgRVZCLTQwMDAKICAgICAgYXJtNjQ6IGR0czogcWNvbTog
c2E4MTU1cC1hZHA6IEludmVyc2UgcGh5LW1vZGUKCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20v
cWNzNDA0LWV2Yi00MDAwLmR0cyAgICAgICB8ICAgMiArLQogYXJjaC9hcm02NC9ib290L2R0cy9x
Y29tL3FjczYxNS1yaWRlLmR0cyAgICAgICAgICAgfCAxMDQgKysrKysrKysrKysrKysrKysrKysr
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2E4MTU1cC1hZHAuZHRzICAgICAgICAgICB8ICAg
MiArLQogYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NtNjE1MC5kdHNpICAgICAgICAgICAgICAg
fCAgMzMgKysrKysrKwogLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRo
cW9zLmMgICAgfCAgMjggKysrKystCiA1IGZpbGVzIGNoYW5nZWQsIDE2MiBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGViOTFiMDRkYTJjM2FjMTdlNGU2NzA3
OWU0NTVmYmE0YmZkMWI0ZjAKY2hhbmdlLWlkOiAyMDI1MDgxMy1xY3M2MTVfZXRoLTllMjk0MjU2
ZjkxMwoKQmVzdCByZWdhcmRzLAotLSAgCllpamllIFlhbmcgPHlpamllLnlhbmdAb3NzLnF1YWxj
b21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
