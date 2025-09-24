Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E7CB9D876
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C881C3F95D;
	Thu, 25 Sep 2025 06:07:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8548C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:56:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCeVsH023770
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 24 Sep 2025 23:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=; b=YT5/si8KhXNMZX2T
 aHs1Jv20X4rPpSuqJFJQf1wRMpf7N5oYFWcKaga1VLr4NskpsTnN7trpywqJyUeQ
 bO1R5lWKu4yUaGpnMtQKRswLPX27qqvAOFW3iy48VNvpO0I6DCFGrp8EsW/bfDx5
 UeOgnTNtuaeMshMVREFEMq+tR7f5ug23iKFmvELINIwf5WWaNHsrJZ9/Is/qS3sm
 IfC1XSdYRRrtdRZWNUFqeS8NMkMpYgH1JbbFLZ+wTrhpWyla7tGtIGEOQ0oYfQVE
 fNeyaxSHVp9k1hi9irhTDhXoAnuSLBLUqpcOrZ0f69tl+K+5Sew38MFgAzsBKmN9
 z4E2Ow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d4ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 23:56:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33428befb83so354114a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 16:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758758217; x=1759363017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=;
 b=OqAmKKMJEIp7kTJuMelEHingARwFBn8DQ7TR1YvBdrSDXjH9bWCSbjFJGnHqUoQa8C
 8rwgIFGOugSsFV3fE2a3GsHofXe0yZ7aJZVkj04rnT4RHfenqrypkbonfk2gK5ktScRK
 QyXvtzZq2T12rPrDuclICpFOLui6C+oKmYV9Y507KGttENBOHUaAHhGK/2Q2j89ZlN4G
 y/HhOKkNS2APT8JEiCHclqtEqaYUzTu323IBo4vEJAbIy7AAfpEoQgTjMRLEP1a8h9dP
 aIswMHt3PlFYyZDYTcfNB7h0ZZD5vHqLOuhbEEUojOJ7poQ4p/tq6gA+1gZ6GF8Lm/Uw
 7gVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUADbQvElWjdfdhKljBBtjpAiUpX3NOvqPwlrsvqDilMx4mhmn3Jkc0h20Y7mWzWXH5y+HeQAHRnRCq6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzk5oLWPuZm7P0mUoB4YjLT8uM3dI7zBQyQcb2AakS2bQjJ5dw2
 BNHx/2fSdGHIy5geyxyHmrCjZbadEoCRSZzk70064xdzJCXY8uQ3lHTLV72DATlW4EZfT97ALnv
 Bq8y8dw/Aq/12V84Vk8JCKWOxKyf9NCTcLtpsZt6VVgBn+oS6TP9b2SkLH753vNV3sbOblCsnqg
 ubvv6QSOM=
X-Gm-Gg: ASbGncskUK36AxEIOIr9GCYT3tGhgZMJpCLUmPhLG9+cP37f2vlZk8S2Icdr1ZzuAf4
 Z9ODI9P20aGcvC3QoWc5JNCo8sLr7v5cbt2EREqjwCWzKuBAUhNpFB2CUB5uap0UHpqrHMFvGt6
 +fAruiYRfpYjOH/sLtms2vs5FUwKUAT67K1dO2P/8mFZZ7/e75qLXL0eVf4x4nEkslKhJ/3LONZ
 sx/CGP7KPLTKZ7vgVkXqv3CR2ijiiKaFc0rxBNHyt3SskUTejiucXWisgtnq+6lksVNJhNBn+3t
 eheZd+Z+G2IYUeAlUy7k4hSXoPx5OAGtlRzKOrCuRQimOgzxY4AIkK+diy9pobTvqE2Q9vbMEF/
 gHQoqk8k4gCr0gcU=
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id
 d9443c01a7336-27ed4ab368fmr13745585ad.56.1758758217270; 
 Wed, 24 Sep 2025 16:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFehxrPaJqcD0zoFcP93jMpuoqnmCDC66PekYT5ca6v2kR3j20bFF+ZvrXw83kR+NSWs2aNaA==
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id
 d9443c01a7336-27ed4ab368fmr13745185ad.56.1758758216782; 
 Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:43 -0700
MIME-Version: 1.0
Message-Id: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=1045;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7G7QgavjnI2PuDqM9mUeILw47Kp6A2VPBmjnh3LL6As=;
 b=Omu47EnR+bgkxUUTbhFMWZbUJ6KHgo0C4uuRJDAgZ109au6Ey0JVTAUiJWM1osKJ5naM/Fl1e
 xl9N1vYgizlCbxAb3FevdwA+lT6Pr52Ad+E6Yhe12SYq+lpZg9pSYPq
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4854a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2bVdrMdO9wEKqzfnleYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: y0FklEkeu6xBGOsn6Sbfc62-plBRTK9Z
X-Proofpoint-ORIG-GUID: y0FklEkeu6xBGOsn6Sbfc62-plBRTK9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX74Y3wlQqZhDX
 +iSsN7EXK395Bni41GdbnHOIRLtUCr3jxpkk42xh+BXnqH94ghYEfOPY86oLH/tepTgxDkdjoR7
 RM/ZT0R+jvkXWYJqk5cp8m4BMv1m8YLqTXpmOgAbdhPKyvmx1N0QNdspLo2EK5f4oLa5WvwQUga
 trq9V5fTi7nTCH5sH5h0pwJJG7yANx0N64YrKNgazKWYGG+eF5ForPpxmnd+wkvPy/h2xe0c+P6
 hr3KOvJW2uuiYxZ/1FDTqJY5V+K6mCJQAwYohObX6bzAd1lAHG1pu7UwiKEvNXtHOBG/o1szh3L
 TNjd5r8BGeMs9Z1xYLpegUXXgzopMJSxJClESHTe/2JLKLcMV8oWISwnkT5U9d3wKmeEwFPcS0J
 /wB1h2hS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:35 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: [Linux-stm32] [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove
 sc8280xp camcc to from sm8450 camcc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Taniya Das <taniya.das@oss.qualcomm.com>

SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
which now supports both MMCX and MXC power domains. Hence move SC8280XP
camcc from SM8450.

Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index c1e06f39431e..dbfcc399f10b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -63,7 +63,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
